@implementation _EXRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _EXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_EXRemoteViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v3, v4);

}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20AE73000, a2, OS_LOG_TYPE_ERROR, "VS terminated with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
