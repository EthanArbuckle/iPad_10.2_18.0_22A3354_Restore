@implementation VNCIContext

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_ciContext, 0);
}

- (uint64_t)renderCIImage:(_QWORD *)a3 buffer:(int)a4 format:(_QWORD *)a5 error:
{
  id v9;
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  CGColorSpaceRef v13;
  CGColorSpace *v14;
  uint64_t v15;

  v9 = a2;
  if (!a1)
    goto LABEL_19;
  if (a4 <= 1278226533)
  {
    if (a4 == 1111970369)
    {
      v10 = (unsigned int *)MEMORY[0x1E0C9E000];
      goto LABEL_14;
    }
    if (a4 != 1278226488)
      goto LABEL_17;
    v11 = (unsigned int *)MEMORY[0x1E0C9E018];
  }
  else
  {
    switch(a4)
    {
      case 1278226534:
        v11 = (unsigned int *)MEMORY[0x1E0C9E028];
        break;
      case 1278226536:
        v11 = (unsigned int *)MEMORY[0x1E0C9E030];
        break;
      case 1380401729:
        v10 = (unsigned int *)MEMORY[0x1E0C9E070];
LABEL_14:
        v12 = *v10;
        v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
        goto LABEL_15;
      default:
LABEL_17:
        if (a5)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unsupported pixel format"));
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
LABEL_19:
        v15 = 0;
        goto LABEL_16;
    }
  }
  v12 = *v11;
  v13 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
LABEL_15:
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 8), "render:toBitmap:rowBytes:bounds:format:colorSpace:", v9, *a3, a3[3], v12, v13, 0.0, 0.0, (double)(unint64_t)a3[2], (double)(unint64_t)a3[1]);
  CGColorSpaceRelease(v14);
  v15 = 1;
LABEL_16:

  return v15;
}

@end
