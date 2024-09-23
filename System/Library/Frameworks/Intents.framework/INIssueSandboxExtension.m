@implementation INIssueSandboxExtension

uint64_t ___INIssueSandboxExtension_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  objc_msgSend(a2, "path");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "fileSystemRepresentation");
  v3 = sandbox_extension_issue_file();

  return v3;
}

@end
