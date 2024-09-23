@implementation ZN2CI22image

CI::TileTask *___ZN2CI22image_render_to_bitmapEPNS_7ContextEPNS_5ImageE6CGRectP12CGColorSpacePNS_6BitmapEPKNS_17RenderDestinationE_block_invoke(uint64_t a1, CI::ProgramNode *this, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGFloat a;
  CGFloat v17;
  float v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double width;
  double v31;
  CI::TileTask *v32;
  uint64_t v33;
  __int128 v34;
  int v35;
  char *v36;
  pid_t v37;
  CGImage *CGImage;
  size_t v39;
  CFURLRef v40;
  const __CFURL *v41;
  char *v42;
  char *v43;
  const __CFString *v44;
  const __CFString *v45;
  CGImageDestination *v46;
  CGImageDestination *v47;
  _BOOL4 v48;
  NSObject *v49;
  double x;
  double y;
  double height;
  CGFloat rect;
  _OWORD v55[3];
  CGAffineTransform v56;
  CGRect v57;
  CGAffineTransform v58;
  double v59[2];
  _QWORD v60[17];
  __int16 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  _QWORD v65[6];
  uint8_t buf[4];
  CGAffineTransform *v67;
  CGAffineTransform __str[5];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v69 = *MEMORY[0x1E0C80C00];
  v65[0] = 0x3FF0000000000000;
  v65[1] = 0;
  v65[2] = 0;
  v65[3] = 0x3FF0000000000000;
  *(double *)&v65[4] = -a3;
  *(double *)&v65[5] = -a4;
  CI::ProgramNode::addDestinationTransform(this, *(const CI::Context **)(a1 + 32), (const CI::Affine *)v65);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(v12 + 96);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = (int)CI::format_bits_per_pixel(*(_DWORD *)(v12 + 104));
  CI::Affine::inverse((CI::Affine *)(a1 + 48), &__str[0].a);
  v64 = __str[0];
  v70.origin.x = a3;
  v70.origin.y = a4;
  v70.size.width = a5;
  v70.size.height = a6;
  v71 = CGRectApplyAffineTransform(v70, &v64);
  x = v71.origin.x;
  y = v71.origin.y;
  height = v71.size.height;
  rect = v71.size.width;
  *(float *)&v71.size.width = v71.size.width;
  v71.size.width = ceilf(*(float *)&v71.size.width);
  v17 = *(double *)(a1 + 104);
  v18 = v71.size.height;
  v71.size.height = ceilf(v18);
  v20 = *(double *)(a1 + 112);
  v19 = *(double *)(a1 + 120);
  v21 = *(double *)(a1 + 128);
  v22 = *(double *)(a1 + 136);
  v63.a = *(CGFloat *)(a1 + 96);
  a = v63.a;
  v63.b = v17;
  v63.c = v20;
  v63.d = v19;
  v63.tx = v21;
  v63.ty = v22;
  v72 = CGRectApplyAffineTransform(v71, &v63);
  v23 = v72.origin.x;
  v24 = v72.origin.y;
  *(float *)&v72.origin.x = v72.size.width;
  v25 = vcvtps_u32_f32(*(float *)&v72.origin.x);
  *(float *)&v72.origin.x = v72.size.height;
  v26 = vcvtps_u32_f32(*(float *)&v72.origin.x);
  v73 = *(CGRect *)(a1 + 144);
  v62.a = a;
  v62.b = v17;
  v62.c = v20;
  v62.d = v19;
  v62.tx = v21;
  v62.ty = v22;
  v74 = CGRectApplyAffineTransform(v73, &v62);
  CI::Bitmap::Bitmap((uint64_t)v60, v14 + v13 * (unint64_t)(v24 - v74.origin.y) + (((unint64_t)(v23 - v74.origin.x) * v15 + 7) >> 3), v25, v26, v13, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 104), *(CGColorSpace **)(a1 + 176));
  v60[0] = &off_1E2EB7688;
  v60[2] = &unk_1E2EB76C0;
  v61 = 0;
  v27 = (double)(unint64_t)(v60[11] / *(_QWORD *)(a1 + 208));
  v59[0] = (double)(unint64_t)(v60[10] / *(_QWORD *)(a1 + 200));
  v59[1] = v27;
  (*(void (**)(_QWORD, _QWORD *, double *, uint64_t, _QWORD))(**(_QWORD **)(a1 + 32) + 352))(*(_QWORD *)(a1 + 32), v60, v59, a1 + 232, *(_QWORD *)(a1 + 216));
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.height = height;
  v58.a = 1.0;
  v58.b = 0.0;
  v58.c = 0.0;
  v58.d = -1.0;
  v58.tx = -x;
  v58.ty = height + y;
  v75.size.width = rect;
  v76 = CGRectApplyAffineTransform(v75, &v58);
  v28 = v76.origin.x;
  v29 = v76.origin.y;
  width = v76.size.width;
  v31 = v76.size.height;
  *(_OWORD *)&v76.origin.y = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v56.a = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v56.c = *(_OWORD *)&v76.origin.y;
  *(_OWORD *)&v56.tx = *(_OWORD *)(a1 + 80);
  v76.origin.y = v29;
  v57 = CGRectApplyAffineTransform(v76, &v56);
  v32 = CI::Context::render(*(CI::Context **)(a1 + 32), this, &v57);
  v33 = *(_QWORD *)(a1 + 32);
  v34 = *(_OWORD *)(a1 + 200);
  v55[0] = *(_OWORD *)(a1 + 184);
  v55[1] = v34;
  v55[2] = *(_OWORD *)(a1 + 216);
  (*(void (**)(uint64_t, _QWORD *, _OWORD *))(*(_QWORD *)v33 + 416))(v33, v60, v55);
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 344))(*(_QWORD *)(a1 + 32));
  if (CI_PRINT_TREE_dump_outputs())
  {
    v35 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 272))(*(_QWORD *)(a1 + 32));
    if (CI_PRINT_TREE_context(v35, (char *)(*(_QWORD *)(a1 + 32) + 236))
      && (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) == (int)CI_PRINT_TREE_frame() || !CI_PRINT_TREE_frame()))
    {
      v36 = CI_TEMP_DIR();
      v37 = getpid();
      snprintf((char *)__str, 0x100uLL, "%s/%d_output_%d_%d_%d_%d_%d.png", v36, v37, *((_DWORD *)this + 9), (int)v28, (int)v29, (int)width, (int)v31);
      CGImage = CI::Bitmap::create_CGImage((CI::Bitmap *)v60);
      if (CGImage)
      {
        v39 = strlen((const char *)__str);
        v40 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__str, v39, 0);
        if (v40)
        {
          v41 = v40;
          v42 = strstr((char *)__str, ".jpg");
          v43 = strstr((char *)__str, ".png");
          v44 = CFSTR("public.png");
          if (!v43)
            v44 = CFSTR("public.tiff");
          if (v42)
            v45 = CFSTR("public.jpeg");
          else
            v45 = v44;
          v46 = CGImageDestinationCreateWithURL(v41, v45, 1uLL, 0);
          if (v46)
          {
            v47 = v46;
            CGImageDestinationAddImage(v46, CGImage, 0);
            v48 = CGImageDestinationFinalize(v47);
            CFRelease(v47);
            CFRelease(v41);
            if (v48)
            {
              v49 = ci_logger_render();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446210;
                v67 = __str;
                _os_log_impl(&dword_1921E4000, v49, OS_LOG_TYPE_DEFAULT, "Dumped output to: %{public}s\n", buf, 0xCu);
              }
            }
          }
          else
          {
            CFRelease(v41);
          }
        }
      }
      CGImageRelease(CGImage);
    }
  }
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 384))(*(_QWORD *)(a1 + 32));
  CI::Affine::inverse((CI::Affine *)v65, &__str[0].a);
  CI::ProgramNode::restoreDestinationTransform((CI::AffineNode **)this, (const CI::Affine *)__str);
  CI::Bitmap::~Bitmap((CI::Bitmap *)v60);
  return v32;
}

@end
