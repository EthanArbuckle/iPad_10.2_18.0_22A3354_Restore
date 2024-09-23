@implementation ZN2CI16GLTextureManager16attach

_QWORD *___ZN2CI16GLTextureManager16attach_IOSurfaceEP11__IOSurfacebiRKNS_17TextureDescriptorEiiib_block_invoke(uint64_t a1)
{
  CI::GLTextureManager *v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t attached_surface;
  _QWORD *result;
  _DWORD *v7;
  size_t Width;
  size_t Height;
  uint64_t v10;
  int API;
  signed int v12;
  uint64_t v13;
  const char *v14;
  size_t HeightOfPlane;
  signed int v16;
  void *v17;
  __IOSurface *v18;
  unsigned int v19;
  const char *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  size_t WidthOfPlane;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  void (*v58)(_QWORD, uint64_t, uint64_t, _QWORD);

  v2 = *(CI::GLTextureManager **)(a1 + 32);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (_QWORD *)((char *)v2 + 168);
  GetMacroContext(*(void **)(*((_QWORD *)v2 + 21) + 392), &v26);
  if (!(_BYTE)v26)
  {
    v4 = ci_logger_render();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      CI::GLTextureManager::upload_texture();
  }
  attached_surface = CI::GLTextureManager::find_attached_surface(v2, *(__IOSurface **)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_DWORD *)(a1 + 56), **(_DWORD **)(a1 + 48));
  ((void (*)(_QWORD, _QWORD))v27)(*((_QWORD *)&v26 + 1), (*(_DWORD *)(a1 + 60) + 33984));
  if (attached_surface)
  {
    result = (_QWORD *)(*((uint64_t (**)(_QWORD, uint64_t, _QWORD))&v30 + 1))(*((_QWORD *)&v26 + 1), 3553, *(unsigned int *)(attached_surface + 8));
    *(_BYTE *)(attached_surface + 24) |= *(_BYTE *)(a1 + 73);
    return result;
  }
  v7 = malloc_type_malloc(0x20uLL, 0x102004016E47894uLL);
  v25 = 0;
  (*((void (**)(_QWORD, uint64_t, unsigned int *))&v48 + 1))(*((_QWORD *)&v26 + 1), 1, &v25);
  (*((void (**)(_QWORD, uint64_t, _QWORD))&v30 + 1))(*((_QWORD *)&v26 + 1), 3553, v25);
  v58(*((_QWORD *)&v26 + 1), 3553, 10240, *(unsigned int *)(a1 + 64));
  v58(*((_QWORD *)&v26 + 1), 3553, 10241, *(unsigned int *)(a1 + 64));
  v58(*((_QWORD *)&v26 + 1), 3553, 10242, *(unsigned int *)(a1 + 68));
  v58(*((_QWORD *)&v26 + 1), 3553, 10243, *(unsigned int *)(a1 + 68));
  Width = IOSurfaceGetWidth(*(IOSurfaceRef *)(a1 + 40));
  Height = IOSurfaceGetHeight(*(IOSurfaceRef *)(a1 + 40));
  v10 = *(_QWORD *)(a1 + 48);
  API = CIEAGLContextGetAPI(*(void **)(*v3 + 392));
  v13 = CI::gl_format_info_for_format(v10, API);
  v14 = "GLTextureManager::attach_IOSurface unsupported format %s!\n";
  if ((_DWORD)v13)
  {
    HeightOfPlane = Height;
    if (HIDWORD(v13))
    {
      v16 = v12;
      if (v12)
      {
        if (*(_BYTE *)(a1 + 72))
        {
          WidthOfPlane = IOSurfaceGetWidthOfPlane(*(IOSurfaceRef *)(a1 + 40), *(int *)(a1 + 56));
          HeightOfPlane = IOSurfaceGetHeightOfPlane(*(IOSurfaceRef *)(a1 + 40), *(int *)(a1 + 56));
        }
        else
        {
          WidthOfPlane = Width;
        }
        v23 = HeightOfPlane;
        v17 = *(void **)(*v3 + 392);
        v18 = *(__IOSurface **)(a1 + 40);
        v19 = *(_DWORD *)(a1 + 56);
        ((void (*)(_QWORD, uint64_t))v54)(*((_QWORD *)&v26 + 1), 7936);
        if ((CIEAGLContextTexImageIOSurface(v17, 0xDE1u, WidthOfPlane, v23, v13, SHIDWORD(v13), v16, v18, v19) & 1) != 0)
          goto LABEL_15;
        v14 = "CIEAGLContextTexImageIOSurface failed for %s!\n";
      }
    }
  }
  v20 = CI::name_for_format(**(_DWORD **)(a1 + 48));
  x_log(v14, v20);
LABEL_15:
  CFRetain(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)v7 = *(_QWORD *)(a1 + 40);
  v7[2] = v25;
  *((_BYTE *)v7 + 12) = *(_BYTE *)(a1 + 72);
  v7[4] = *(_DWORD *)(a1 + 56);
  v7[5] = **(_DWORD **)(a1 + 48);
  *((_BYTE *)v7 + 24) = *(_BYTE *)(a1 + 73);
  v21 = (uint64_t *)*((_QWORD *)v2 + 22);
  result = operator new(0x18uLL);
  result[1] = v21;
  result[2] = v7;
  v22 = *v21;
  *result = *v21;
  *(_QWORD *)(v22 + 8) = result;
  *v21 = (uint64_t)result;
  ++v21[2];
  return result;
}

@end
