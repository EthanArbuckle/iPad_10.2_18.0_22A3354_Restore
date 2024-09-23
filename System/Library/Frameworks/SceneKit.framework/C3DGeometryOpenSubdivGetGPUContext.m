@implementation C3DGeometryOpenSubdivGetGPUContext

void __C3DGeometryOpenSubdivGetGPUContext_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const void *v4;

  objc_msgSend(-[SCNMTLRenderContext commandBufferStatusMonitor](*(id **)(a1 + 32)), "renderContext:commandBufferDidCompleteWithError:", *(_QWORD *)(a1 + 32), a2);
  v3 = scn_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __C3DGeometryOpenSubdivGetGPUContext_block_invoke_cold_1(a1, v3);
  v4 = *(const void **)(*(_QWORD *)(a1 + 48) + 24);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = 0;
  }
}

void __C3DGeometryOpenSubdivGetGPUContext_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t Name;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  Name = C3DEntityGetName(*(_QWORD *)(a1 + 40));
  v4 = 138412290;
  v5 = Name;
  _os_log_error_impl(&dword_1DCCB8000, a2, OS_LOG_TYPE_ERROR, "Error: Invalidating OpenSubdiv runtime data of geometry %@", (uint8_t *)&v4, 0xCu);
}

@end
