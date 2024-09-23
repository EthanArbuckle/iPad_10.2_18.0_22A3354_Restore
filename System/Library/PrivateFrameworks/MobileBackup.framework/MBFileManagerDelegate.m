@implementation MBFileManagerDelegate

- (BOOL)fileManager:(id)a3 shouldCopyItemAtPath:(id)a4 toPath:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  char v10;

  v7 = a5;
  v8 = a4;
  -[MBFileManagerDelegate shouldCopyItemAtPathToPath](self, "shouldCopyItemAtPathToPath");
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((uint64_t (**)(_QWORD, id, id))v9)[2](v9, v8, v7);

  return v10;
}

- (id)shouldCopyItemAtPathToPath
{
  return self->_shouldCopyItemAtPathToPath;
}

- (void)setShouldCopyItemAtPathToPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldCopyItemAtPathToPath, 0);
}

@end
