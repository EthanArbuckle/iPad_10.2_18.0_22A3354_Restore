@implementation ARMeshGeometryFromMeshNoCopy

void __ARMeshGeometryFromMeshNoCopy_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a3)
  {
    _ARLogGeneral_8();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a3, "localizedFailureReason");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1B3A68000, v5, OS_LOG_TYPE_ERROR, "%@: %@", (uint8_t *)&v7, 0x16u);

    }
  }

}

@end
