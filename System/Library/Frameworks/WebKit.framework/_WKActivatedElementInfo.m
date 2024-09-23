@implementation _WKActivatedElementInfo

+ (id)activatedElementInfoWithInteractionInformationAtPosition:(const void *)a3 userInfo:(id)a4
{
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc((Class)a1), "_initWithInteractionInformationAtPosition:isUsingAlternateURLForImage:userInfo:", a3, 0, a4));
}

- (id)_initWithInteractionInformationAtPosition:(const void *)a3 isUsingAlternateURLForImage:(BOOL)a4 userInfo:(id)a5
{
  char *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const __CFString *v15;
  const void **v16;
  const void *v17;
  const __CFString *v18;
  const void **v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int *v27;
  unsigned int v28;
  uint64_t v29;
  const __CFString *v30;
  const void **v31;
  const void *v32;
  const void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)_WKActivatedElementInfo;
  v8 = -[_WKActivatedElementInfo init](&v35, sel_init);
  if (!v8)
    return v8;
  v9 = (const void *)WTF::URL::operator NSURL *();
  v10 = v9;
  if (v9)
    CFRetain(v9);
  v11 = (const void *)*((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v10;
  if (v11)
    CFRelease(v11);
  v12 = (const void *)WTF::URL::operator NSURL *();
  v13 = v12;
  if (v12)
    CFRetain(v12);
  v14 = (const void *)*((_QWORD *)v8 + 2);
  *((_QWORD *)v8 + 2) = v13;
  if (v14)
    CFRelease(v14);
  if (*((_QWORD *)a3 + 19))
  {
    v15 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v16 = (const void **)(v8 + 56);
    if (!v15)
      goto LABEL_13;
  }
  else
  {
    v16 = (const void **)(v8 + 56);
    v15 = &stru_1E351F1B8;
  }
  CFRetain(v15);
LABEL_13:
  v17 = *v16;
  *v16 = v15;
  if (v17)
    CFRelease(v17);
  *((_QWORD *)v8 + 4) = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 20))
  {
    v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v19 = (const void **)(v8 + 24);
    if (!v18)
      goto LABEL_18;
  }
  else
  {
    v19 = (const void **)(v8 + 24);
    v18 = &stru_1E351F1B8;
  }
  CFRetain(v18);
LABEL_18:
  v20 = *v19;
  *v19 = v18;
  if (v20)
    CFRelease(v20);
  WebCore::IntRect::operator CGRect();
  *((_QWORD *)v8 + 15) = v22;
  *((_QWORD *)v8 + 16) = v23;
  *((_QWORD *)v8 + 17) = v24;
  *((_QWORD *)v8 + 18) = v25;
  if (*((_BYTE *)a3 + 26))
  {
    v26 = 2;
LABEL_22:
    *((_QWORD *)v8 + 14) = v26;
    goto LABEL_25;
  }
  if (!*((_BYTE *)a3 + 24))
  {
    if (*((_BYTE *)a3 + 25))
      v26 = 1;
    else
      v26 = 3;
    goto LABEL_22;
  }
  *((_QWORD *)v8 + 14) = 0;
LABEL_25:
  v27 = (unsigned int *)*((_QWORD *)a3 + 24);
  if (v27)
  {
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 + 1, v27));
  }
  v29 = *((_QWORD *)v8 + 6);
  *((_QWORD *)v8 + 6) = v27;
  if (v29)
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref(v29, v21);
  if (!*((_QWORD *)a3 + 21))
  {
    v31 = (const void **)(v8 + 40);
    v30 = &stru_1E351F1B8;
    goto LABEL_31;
  }
  v30 = (const __CFString *)WTF::StringImpl::operator NSString *();
  v31 = (const void **)(v8 + 40);
  if (v30)
LABEL_31:
    CFRetain(v30);
  v32 = *v31;
  *v31 = v30;
  if (v32)
    CFRelease(v32);
  v8[104] = *((_BYTE *)a3 + 27);
  v8[80] = *((_BYTE *)a3 + 28);
  v8[81] = *((_BYTE *)a3 + 29);
  v8[105] = *((_BYTE *)a3 + 25);
  v8[106] = a4;
  if (a5)
    CFRetain(a5);
  v33 = (const void *)*((_QWORD *)v8 + 9);
  *((_QWORD *)v8 + 9) = a5;
  if (v33)
    CFRelease(v33);
  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(v8 + 88), (uint64_t)a3 + 624);
  return v8;
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 information:(const void *)a5
{
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:information:](self, "_initWithType:URL:imageURL:information:", a3, a4, WTF::URL::operator NSURL *(), a5);
}

- (id)_initWithType:(int64_t)a3 image:(void *)a4 information:(const void *)a5
{
  uint64_t v9;

  v9 = WTF::URL::operator NSURL *();
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:image:userInfo:information:](self, "_initWithType:URL:imageURL:image:userInfo:information:", a3, v9, WTF::URL::operator NSURL *(), a4, 0, a5);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 information:(const void *)a6
{
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:image:userInfo:information:](self, "_initWithType:URL:imageURL:image:userInfo:information:", a3, a4, a5, *((_QWORD *)a6 + 24), 0, a6);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 image:(void *)a5 information:(const void *)a6
{
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:image:userInfo:information:](self, "_initWithType:URL:imageURL:image:userInfo:information:", a3, a4, WTF::URL::operator NSURL *(), a5, 0, a6);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 userInfo:(id)a6 information:(const void *)a7
{
  return -[_WKActivatedElementInfo _initWithType:URL:imageURL:image:userInfo:information:](self, "_initWithType:URL:imageURL:image:userInfo:information:", a3, a4, a5, *((_QWORD *)a7 + 24), a6);
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 image:(void *)a6 userInfo:(id)a7 information:(const void *)a8
{
  const __CFString *v11;
  const __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const __CFString *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  id v26;
  WTF *v27;
  WTF *v28;
  uint64_t v30;
  WTF *v35;
  int v36;
  WTF *v37;
  int v38;

  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v37, (uint64_t)a8 + 624);
  if (*((_QWORD *)a8 + 20))
    v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v11 = &stru_1E351F1B8;
  if (*((_QWORD *)a8 + 21))
    v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v12 = &stru_1E351F1B8;
  WebCore::IntRect::operator CGRect();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  if (*((_QWORD *)a8 + 19))
    v21 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v21 = &stru_1E351F1B8;
  v22 = *((unsigned __int8 *)a8 + 27);
  v23 = *((unsigned __int8 *)a8 + 28);
  v24 = *((unsigned __int8 *)a8 + 29);
  WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v35, (uint64_t)&v37);
  BYTE2(v30) = v24 != 0;
  BYTE1(v30) = v23 != 0;
  LOBYTE(v30) = v22 != 0;
  v26 = -[_WKActivatedElementInfo _initWithType:URL:imageURL:location:title:ID:rect:image:imageMIMEType:isAnimatedImage:isAnimating:canShowAnimationControls:animationsUnderElement:userInfo:](self, "_initWithType:URL:imageURL:location:title:ID:rect:image:imageMIMEType:isAnimatedImage:isAnimating:canShowAnimationControls:animationsUnderElement:userInfo:", a3, a4, a5, a8, v11, v12, v14, v16, v18, v20, a6, v21, v30, &v35, a7);
  v27 = v35;
  if (v35)
  {
    v35 = 0;
    v36 = 0;
    WTF::fastFree(v27, v25);
  }
  v28 = v37;
  if (v37)
  {
    v37 = 0;
    v38 = 0;
    WTF::fastFree(v28, v25);
  }
  return v26;
}

- (id)_initWithType:(int64_t)a3 URL:(id)a4 imageURL:(id)a5 location:(const IntPoint *)a6 title:(id)a7 ID:(id)a8 rect:(CGRect)a9 image:(void *)a10 imageMIMEType:(id)a11 isAnimatedImage:(BOOL)a12 isAnimating:(BOOL)a13 canShowAnimationControls:(BOOL)a14 animationsUnderElement:()Vector<WebCore:()0UL :()WTF:()16UL :(WTF:(id)a16 :FastMalloc>)a15 CrashOnOverflow ElementAnimationContext userInfo:
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  const void *v32;
  void *v33;
  uint64_t v34;
  const void *v35;
  unsigned int v36;
  uint64_t v37;
  const void *v38;
  uint64_t v39;
  const void *v40;
  objc_super v42;

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v42.receiver = self;
  v42.super_class = (Class)_WKActivatedElementInfo;
  v26 = -[_WKActivatedElementInfo init](&v42, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(a4, "copy");
    v28 = (const void *)*((_QWORD *)v26 + 1);
    *((_QWORD *)v26 + 1) = v27;
    if (v28)
      CFRelease(v28);
    v29 = objc_msgSend(a5, "copy");
    v30 = (const void *)*((_QWORD *)v26 + 2);
    *((_QWORD *)v26 + 2) = v29;
    if (v30)
      CFRelease(v30);
    v31 = objc_msgSend(a11, "copy");
    v32 = (const void *)*((_QWORD *)v26 + 7);
    *((_QWORD *)v26 + 7) = v31;
    if (v32)
      CFRelease(v32);
    *((IntPoint *)v26 + 4) = *a6;
    v34 = objc_msgSend(a7, "copy");
    v35 = (const void *)*((_QWORD *)v26 + 3);
    *((_QWORD *)v26 + 3) = v34;
    if (v35)
      CFRelease(v35);
    *((CGFloat *)v26 + 15) = x;
    *((CGFloat *)v26 + 16) = y;
    *((CGFloat *)v26 + 17) = width;
    *((CGFloat *)v26 + 18) = height;
    *((_QWORD *)v26 + 14) = a3;
    if (a10)
    {
      do
        v36 = __ldaxr((unsigned int *)a10);
      while (__stlxr(v36 + 1, (unsigned int *)a10));
    }
    v37 = *((_QWORD *)v26 + 6);
    *((_QWORD *)v26 + 6) = a10;
    if (v37)
      WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref(v37, v33);
    if (a8)
      CFRetain(a8);
    v38 = (const void *)*((_QWORD *)v26 + 5);
    *((_QWORD *)v26 + 5) = a8;
    if (v38)
      CFRelease(v38);
    v39 = objc_msgSend(*(id *)&a15.m_capacity, "copy");
    v40 = (const void *)*((_QWORD *)v26 + 9);
    *((_QWORD *)v26 + 9) = v39;
    if (v40)
      CFRelease(v40);
    *((_BYTE *)v26 + 80) = a13;
    *((_BYTE *)v26 + 81) = a14;
    WTF::Vector<WebCore::ElementAnimationContext,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v26 + 88, (uint64_t)a15.m_buffer);
    *((_BYTE *)v26 + 104) = a12;
  }
  return v26;
}

- (NSURL)URL
{
  return (NSURL *)self->_URL.m_ptr;
}

- (NSURL)imageURL
{
  return (NSURL *)self->_imageURL.m_ptr;
}

- (NSString)title
{
  return (NSString *)self->_title.m_ptr;
}

- (NSString)imageMIMEType
{
  return (NSString *)self->_imageMIMEType.m_ptr;
}

- (NSString)ID
{
  return (NSString *)self->_ID.m_ptr;
}

- (IntPoint)_interactionLocation
{
  return self->_interactionLocation;
}

- (BOOL)isAnimatedImage
{
  return self->_animatedImage;
}

- (BOOL)_isUsingAlternateURLForImage
{
  return self->_isUsingAlternateURLForImage;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)canShowAnimationControls
{
  return self->_canShowAnimationControls;
}

- (const)_animationsUnderElement
{
  return &self->_animationsUnderElement;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)self->_userInfo.m_ptr;
}

- (BOOL)_isImage
{
  return self->_isImage;
}

- (UIImage)image
{
  void *m_ptr;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  ShareableBitmap *v9;
  CFTypeRef cf;

  m_ptr = self->_cocoaImage.m_ptr;
  if (m_ptr)
    return (UIImage *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(m_ptr, "copy"));
  if (!self->_image.m_ptr)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0CEA638]);
  WebCore::ShareableBitmap::makeCGImageCopy((WebCore::ShareableBitmap *)self->_image.m_ptr);
  v7 = (void *)objc_msgSend(v5, "initWithCGImage:", cf);
  v8 = self->_cocoaImage.m_ptr;
  self->_cocoaImage.m_ptr = v7;
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  v9 = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (v9)
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v9, v6);
  return (UIImage *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_cocoaImage.m_ptr, "copy"));
}

- (int64_t)type
{
  return self->_type;
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  ElementAnimationContext *m_buffer;
  void *m_ptr;
  void *v5;
  void *v6;
  ShareableBitmap *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  m_buffer = self->_animationsUnderElement.m_buffer;
  if (m_buffer)
  {
    self->_animationsUnderElement.m_buffer = 0;
    self->_animationsUnderElement.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  m_ptr = self->_userInfo.m_ptr;
  self->_userInfo.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_cocoaImage.m_ptr;
  self->_cocoaImage.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_imageMIMEType.m_ptr;
  self->_imageMIMEType.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (v7)
    WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v7, (void *)a2);
  v8 = self->_ID.m_ptr;
  self->_ID.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10 = self->_imageURL.m_ptr;
  self->_imageURL.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_URL.m_ptr;
  self->_URL.m_ptr = 0;
  if (v11)
    CFRelease(v11);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
