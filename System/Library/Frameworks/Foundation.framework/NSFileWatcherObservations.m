@implementation NSFileWatcherObservations

- (NSFileWatcherObservations)initWithPath:(id)a3
{
  NSFileWatcherObservations *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileWatcherObservations;
  v4 = -[NSFileWatcherObservations init](&v6, sel_init);
  if (v4)
    v4->_path = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)addDeletion
{
  NSObject *v3;
  NSString *path;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    v5 = 138477827;
    v6 = path;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Detected deletion of %{private}@", (uint8_t *)&v5, 0xCu);
  }
  self->_deleted = 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileWatcherObservations;
  -[NSFileWatcherObservations dealloc](&v3, sel_dealloc);
}

- (void)addAttributeChange
{
  NSObject *v3;
  NSString *path;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    v5 = 138477827;
    v6 = path;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Detected attribute change to %{private}@", (uint8_t *)&v5, 0xCu);
  }
  self->_attributesChanged = 1;
}

- (void)addContentsChange
{
  NSObject *v3;
  NSString *path;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    v5 = 138477827;
    v6 = path;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "Detected content change to %{private}@", (uint8_t *)&v5, 0xCu);
  }
  self->_contentsChanged = 1;
}

- (void)addDetectedMoveToPath:(id)a3
{
  NSObject *v5;
  NSString *lastObservedPath;
  NSString *path;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    v8 = 138478083;
    v9 = path;
    v10 = 2113;
    v11 = a3;
    _os_log_debug_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEBUG, "Detected move of %{private}@ to %{private}@", (uint8_t *)&v8, 0x16u);
  }
  self->_moved = 1;
  lastObservedPath = self->_lastObservedPath;
  if (lastObservedPath != a3)
  {

    self->_lastObservedPath = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)addAnnouncedMoveToPath:(id)a3
{
  NSObject *v5;
  NSString *path;
  int v7;
  NSString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = _NSFCFSEventsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    v7 = 138478083;
    v8 = path;
    v9 = 2113;
    v10 = a3;
    _os_log_debug_impl(&dword_1817D9000, v5, OS_LOG_TYPE_DEBUG, "Announced move of %{private}@ to %{private}@", (uint8_t *)&v7, 0x16u);
  }
  self->_didResetPath = 1;

  self->_path = (NSString *)objc_msgSend(a3, "copy");
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSFileWatcherObservations;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ attrib: %d cont: %d del: %d mov: %d last-path: %@ res: %d path: %@"), -[NSFileWatcherObservations description](&v3, sel_description), self->_attributesChanged, self->_contentsChanged, self->_deleted, self->_moved, self->_lastObservedPath, self->_didResetPath, self->_path);
}

- (void)notifyObserver:(id)a3
{
  const char *v5;
  int v6;
  int v7;
  __darwin_ino64_t st_ino;
  __darwin_ino64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  NSObject *v15;
  NSString *v16;
  NSString *v17;
  NSString *lastObservedPath;
  NSString *path;
  stat v20;
  stat v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!*(_WORD *)&self->_deleted && !self->_didResetPath)
  {
    v11 = 0;
    if (self->_contentsChanged)
      v12 = 2;
    else
      v12 = 4 * self->_attributesChanged;
    goto LABEL_28;
  }
  v5 = -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation");
  v6 = open(v5, 2129920);
  if (v6 == -1)
  {
    if (self->_deleted || !self->_moved || self->_didResetPath)
    {
      v11 = 0;
      if (self->_didResetPath)
        v12 = 24;
      else
        v12 = 8;
    }
    else
    {
      v15 = _NSFCFSEventsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        lastObservedPath = self->_lastObservedPath;
        v21.st_dev = 138477827;
        *(_QWORD *)&v21.st_mode = lastObservedPath;
        _os_log_debug_impl(&dword_1817D9000, v15, OS_LOG_TYPE_DEBUG, "Reporting non-coordinated move to %{private}@", (uint8_t *)&v21, 0xCu);
      }

      v16 = self->_lastObservedPath;
      v11 = 0;
      self->_path = v16;
      v12 = 16;
    }
  }
  else
  {
    v7 = v6;
    if (!self->_didResetPath
      || !self->_moved
      || self->_deleted
      || (memset(&v21, 0, sizeof(v21)), fstat(v6, &v21))
      || (memset(&v20, 0, sizeof(v20)), lstat(v5, &v20))
      || v21.st_dev != v20.st_dev)
    {
      close(v7);
    }
    else
    {
      st_ino = v21.st_ino;
      v9 = v20.st_ino;
      close(v7);
      if (st_ino == v9)
      {
        v10 = _NSFCFSEventsLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          path = self->_path;
          v21.st_dev = 138477827;
          *(_QWORD *)&v21.st_mode = path;
          _os_log_debug_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEBUG, "URL %{private}@ reset unnecessarily", (uint8_t *)&v21, 0xCu);
        }
        v11 = 0;
        v12 = 0;
        goto LABEL_28;
      }
    }
    if (self->_contentsChanged || self->_deleted || self->_moved)
    {
      v13 = _NSFCFSEventsLog();
      v14 = 2;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v17 = self->_path;
        v21.st_dev = 138477827;
        *(_QWORD *)&v21.st_mode = v17;
        _os_log_debug_impl(&dword_1817D9000, v13, OS_LOG_TYPE_DEBUG, "Change, deletion, or movement of %{private}@ interpreted as change", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      v14 = 4 * self->_attributesChanged;
    }
    if (self->_didResetPath)
      v12 = v14 | 0x10;
    else
      v12 = v14;
    v11 = 1;
  }
LABEL_28:
  (*((void (**)(id, uint64_t, uint64_t, NSString *))a3 + 2))(a3, v11, v12, self->_path);
}

@end
