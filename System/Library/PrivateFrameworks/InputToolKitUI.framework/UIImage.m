@implementation UIImage

void __48__UIImage_ITKUtilities__itk_imageWithTint_size___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextSetBlendMode(v3, kCGBlendModeNormal);
  objc_msgSend(*(id *)(a1 + 32), "setFill");
  CGContextFillRect(v3, *(CGRect *)(a1 + 64));
  CGContextSetBlendMode(v3, kCGBlendModeDestinationIn);
  CGContextDrawImage(v3, *(CGRect *)(a1 + 64), (CGImageRef)objc_msgSend(*(id *)(a1 + 40), "itk_cgImage"));
}

uint64_t __55__UIImage_ITKUtilities__itk_scaledImageWithSize_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __55__UIImage_ITKUtilities__itk_imageDataWithRequirements___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  size_t v6;
  dispatch_data_t v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = mmap(0, objc_msgSend(v3, "length"), 3, 4097, -1, 0);
  v5 = objc_retainAutorelease(v3);
  memcpy(v4, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  v6 = objc_msgSend(v5, "length");

  v7 = dispatch_data_create(v4, v6, 0, (dispatch_block_t)*MEMORY[0x24BDAC988]);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __50__UIImage_ITKUtilities__itk_decodeWithCompletion___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1710]);
  v1 = (void *)itk_decodeWithCompletion__drawingDecodingOperationQueue;
  itk_decodeWithCompletion__drawingDecodingOperationQueue = (uint64_t)v0;

  objc_msgSend((id)itk_decodeWithCompletion__drawingDecodingOperationQueue, "setName:", CFSTR("com.apple.notes.drawing-decoding-queue"));
  return objc_msgSend((id)itk_decodeWithCompletion__drawingDecodingOperationQueue, "setMaxConcurrentOperationCount:", 2);
}

void __50__UIImage_ITKUtilities__itk_decodeWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "itk_decodeInBackground");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__UIImage_ITKUtilities__itk_decodeWithCompletion___block_invoke_3;
  v5[3] = &unk_250FA1138;
  v3 = *(id *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __50__UIImage_ITKUtilities__itk_decodeWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __47__UIImage_ITKUtilities__itk_decodeInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0);
}

@end
