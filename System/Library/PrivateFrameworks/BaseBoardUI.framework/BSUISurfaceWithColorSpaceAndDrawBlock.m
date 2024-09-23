@implementation BSUISurfaceWithColorSpaceAndDrawBlock

void __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke(uint64_t a1, CGContext *a2)
{
  double v3;
  double v4;
  void (**v5)(_QWORD);
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v11;

  v4 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v5 = (void (**)(_QWORD))*(id *)(a1 + 32);
  v6 = v5;
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __BSUIImagePerformUIDrawBlock(CGContextRef, CGSize, CGFloat, __strong BSBlock)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("BSUIImageUtilities.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

    if (v6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __BSUIImagePerformUIDrawBlock(CGContextRef, CGSize, CGFloat, __strong BSBlock)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("BSUIImageUtilities.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("drawBlock"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  CGContextSaveGState(a2);
  CGContextTranslateCTM(a2, 0.0, v3 * v4);
  CGContextScaleCTM(a2, v3, -v3);
  CGContextGetCTM(&v11, a2);
  CGContextSetBaseCTM();
  UIGraphicsPushContext(a2);
  v6[2](v6);
  UIGraphicsPopContext();
  CGContextRestoreGState(a2);

}

void __BSUISurfaceWithColorSpaceAndDrawBlock_block_invoke_2(uint64_t a1, uint64_t a2, CGColorSpace *a3)
{
  const void *Surface;
  const void *v6;
  uint64_t v7;
  void *v8;
  CFPropertyListRef v9;
  void *v10;
  void *v11;
  __IOSurface *buffer;

  Surface = (const void *)CGIOSurfaceContextGetSurface();
  if (Surface)
  {
    v6 = Surface;
    CFRetain(Surface);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    buffer = (__IOSurface *)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (buffer)
    {
      if (a3)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void __BSUIIOSurfaceSetColorSpace(IOSurface *__strong, CGColorSpaceRef)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("BSUIImageUtilities.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("surface"), 0);

      if (a3)
      {
LABEL_4:
        v9 = CGColorSpaceCopyPropertyList(a3);
        if (v9)
        {
          IOSurfaceSetValue(buffer, (CFStringRef)*MEMORY[0x1E0CBBF90], v9);
          CFRelease(v9);
        }
      }
    }

  }
}

@end
