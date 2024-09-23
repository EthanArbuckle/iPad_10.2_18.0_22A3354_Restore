@implementation WKDragSessionContext

- (void)addTemporaryDirectory:(id)a3
{
  void *m_ptr;
  void *v6;

  m_ptr = self->_temporaryDirectories.m_ptr;
  if (!m_ptr)
  {
    m_ptr = (void *)objc_opt_new();
    v6 = self->_temporaryDirectories.m_ptr;
    self->_temporaryDirectories.m_ptr = m_ptr;
    if (v6)
    {
      CFRelease(v6);
      m_ptr = self->_temporaryDirectories.m_ptr;
    }
  }
  objc_msgSend(m_ptr, "addObject:", a3);
}

- (void)cleanUpTemporaryDirectories
{
  void *m_ptr;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  m_ptr = self->_temporaryDirectories.m_ptr;
  v3 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(m_ptr);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v11 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", v7, &v11);
        v8 = qword_1ECE71078;
        if (os_log_type_enabled((os_log_t)qword_1ECE71078, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v7;
          v18 = 2112;
          v19 = v11;
          _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEFAULT, "Removed temporary download directory: %@ with error: %@", buf, 0x16u);
        }
      }
      v4 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v4);
  }
  v9 = self->_temporaryDirectories.m_ptr;
  self->_temporaryDirectories.m_ptr = 0;
  if (v9)
    CFRelease(v9);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_temporaryDirectories.m_ptr;
  self->_temporaryDirectories.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
