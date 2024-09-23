@implementation DiagnosticsReporterLaunchOptions

- (NSArray)files_to_attach
{
  return self->_files_to_attach;
}

- (void)setFiles_to_attach:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)log_path
{
  return self->_log_path;
}

- (void)setLog_path:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)panic_string
{
  return self->_panic_string;
}

- (void)setPanic_string:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panic_string, 0);
  objc_storeStrong((id *)&self->_log_path, 0);
  objc_storeStrong((id *)&self->_files_to_attach, 0);
}

@end
