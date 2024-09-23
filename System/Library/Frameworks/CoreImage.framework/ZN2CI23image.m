@implementation ZN2CI23image

CI::TileTask *___ZN2CI23image_render_to_surfaceEPNS_7ContextEPNS_5ImageE6CGRectP11__IOSurfacePKNS_17RenderDestinationE_block_invoke(uint64_t a1, CI::ProgramNode *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CI::TileTask *v8;
  int v9;
  char *v10;
  pid_t v11;
  uint64_t v12;
  CGColorSpace *v13;
  NSObject *v14;
  CGRect v16;
  uint8_t buf[4];
  char *v18;
  char __str[256];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  v8 = CI::Context::render(*(CI::Context **)(a1 + 32), a2, &v16);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 344))(*(_QWORD *)(a1 + 32));
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 344))
  {
    if (CI_PRINT_TREE_dump_outputs())
    {
      v9 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 272))(*(_QWORD *)(a1 + 32));
      if (CI_PRINT_TREE_context(v9, (char *)(*(_QWORD *)(a1 + 32) + 236))
        && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) == (int)CI_PRINT_TREE_frame()
         || !CI_PRINT_TREE_frame()))
      {
        v10 = CI_TEMP_DIR();
        v11 = getpid();
        snprintf(__str, 0x100uLL, "%s/%d_output_%d_%d_%d_%d_%d.png", v10, v11, *((_DWORD *)a2 + 9), (int)v16.origin.x, (int)v16.origin.y, (int)v16.size.width, (int)v16.size.height);
        v12 = *(_QWORD *)(a1 + 48);
        if (v12)
          v13 = *(CGColorSpace **)(v12 + 24);
        else
          v13 = 0;
        if (SurfaceWriteToFile(*(__IOSurface **)(a1 + 40), v13, __str))
        {
          v14 = ci_logger_render();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v18 = __str;
            _os_log_impl(&dword_1921E4000, v14, OS_LOG_TYPE_DEFAULT, "Dumped output to: %{public}s\n", buf, 0xCu);
          }
        }
      }
    }
  }
  return v8;
}

@end
