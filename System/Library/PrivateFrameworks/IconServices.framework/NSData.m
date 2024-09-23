@implementation NSData

void __61__NSData_ISCompositorResourceValidationToken___is_validToken__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E0C80C00]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getUUIDBytes:", &v4);

  v5 = -1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", CFSTR("valid_token"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getUUIDBytes:", &v6);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 40);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_is_validToken_validToken;
  _is_validToken_validToken = v2;

}

void __63__NSData_ISCompositorResourceValidationToken___is_invalidToken__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E0C80C00]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getUUIDBytes:", &v4);

  v5 = -1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", CFSTR("invalid_token"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getUUIDBytes:", &v6);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 40);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_is_invalidToken_invalidToken;
  _is_invalidToken_invalidToken = v2;

}

void __61__NSData_ISCompositorResourceValidationToken___is_staleToken__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID", 0, 0, 0, 0, 0, *MEMORY[0x1E0C80C00]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getUUIDBytes:", &v4);

  v5 = -1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", CFSTR("stale_token"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getUUIDBytes:", &v6);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v4, 40);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_is_staleToken_staleToken;
  _is_staleToken_staleToken = v2;

}

void __62__NSData_ISStoreIndex_BlobTable___ISStoreIndex_blobDataForID___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
