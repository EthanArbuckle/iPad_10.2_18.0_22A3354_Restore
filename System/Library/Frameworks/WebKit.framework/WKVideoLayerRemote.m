@implementation WKVideoLayerRemote

- (WKVideoLayerRemote)init
{
  WKVideoLayerRemote *v2;
  WKVideoLayerRemote *v3;
  WebCore::TimerBase *v4;
  uint64_t v5;
  Timer *value;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKVideoLayerRemote;
  v2 = -[WKVideoLayerRemote init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WKVideoLayerRemote setMasksToBounds:](v2, "setMasksToBounds:", 1);
    location = 0;
    objc_initWeak(&location, v3);
    v4 = (WebCore::TimerBase *)WTF::fastMalloc((WTF *)0x38);
    v5 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v5 = off_1E34D0FE8;
    *(_QWORD *)(v5 + 8) = 0;
    objc_moveWeak((id *)(v5 + 8), &location);
    WebCore::TimerBase::TimerBase(v4);
    *(_QWORD *)v4 = off_1E34B3740;
    *((_QWORD *)v4 + 6) = v5;
    value = v3->_resolveBoundsTimer.__ptr_.__value_;
    v3->_resolveBoundsTimer.__ptr_.__value_ = (Timer *)v4;
    if (value)
      (*(void (**)(Timer *))(*(_QWORD *)value + 8))(value);
    objc_destroyWeak(&location);
    v3->_shouldRestartWhenTimerFires = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)WKVideoLayerRemote;
    -[WKVideoLayerRemote dealloc](&v4, sel_dealloc);
  }
}

- (void)mediaPlayerPrivateRemote
{
  ThreadSafeWeakPtr<WebKit::MediaPlayerPrivateRemote> *p_mediaPlayerPrivateRemote;
  unsigned __int8 *m_ptr;
  unsigned __int8 **v4;
  unsigned __int8 **v6;

  p_mediaPlayerPrivateRemote = &self->_mediaPlayerPrivateRemote;
  m_ptr = (unsigned __int8 *)self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
  if (!m_ptr)
    return 0;
  WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::RemoteMediaResource>(m_ptr, (uint64_t)p_mediaPlayerPrivateRemote->m_objectOfCorrectType, &v6);
  v4 = v6;
  v6 = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(v4[6]);
  return v4;
}

- (void)setMediaPlayerPrivateRemote:(void *)a3
{
  WTF::ThreadSafeWeakPtr<WebKit::MediaPlayerPrivateRemote>::operator=<WebKit::MediaPlayerPrivateRemote,(void *)0>((uint64_t)&self->_mediaPlayerPrivateRemote, a3);
}

- (unsigned)videoGravity
{
  return self->_videoGravity;
}

- (void)setVideoGravity:(unsigned __int8)a3
{
  self->_videoGravity = a3;
}

- (BOOL)resizePreservingGravity
{
  unsigned __int8 **v3;
  unsigned __int8 **v4;
  unsigned __int8 **v5;
  BOOL v6;

  v3 = -[WKVideoLayerRemote mediaPlayerPrivateRemote](self, "mediaPlayerPrivateRemote");
  if (!v3)
    return self->_videoGravity != 0;
  v4 = v3;
  v5 = v3 + 6;
  WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<WebKit::RemoteAudioHardwareListener,(WTF::DestructionThread)0>::ref(v3 + 6);
  if ((*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)v4[19] + 40))(v4[19]))
    v6 = 1;
  else
    v6 = self->_videoGravity != 0;
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*v5);
  return v6;
}

- (void)layoutSublayers
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  __int128 v16;
  unsigned __int8 *m_ptr;
  uint64_t v18;
  float v19;
  float v20;
  const FloatRect *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  const FloatRect *v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  void *v34;
  double MidX;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  Timer *value;
  double v41;
  CGAffineTransform v42;
  uint64_t v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  CGRect v54;
  CGRect v55;

  v3 = (void *)-[WKVideoLayerRemote sublayers](self, "sublayers");
  if (objc_msgSend(v3, "count") == 1)
  {
    -[WKVideoLayerRemote videoLayerFrame](self, "videoLayerFrame");
    v44.a = v4;
    v44.b = v5;
    v44.c = v6;
    v44.d = v7;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v50, (const CGRect *)&v44);
    -[WKVideoLayerRemote bounds](self, "bounds");
    v44.a = v8;
    v44.b = v9;
    v44.c = v10;
    v44.d = v11;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v46, (const CGRect *)&v44);
    *(float *)&v13 = v51;
    if (v50 != v46 || v51 != v47)
      goto LABEL_16;
    *(float *)&v12 = v52;
    *(float *)&v13 = v53;
    if (v52 != v48 || v53 != v49)
      goto LABEL_16;
    if (self)
      -[WKVideoLayerRemote affineTransform](self, "affineTransform", v12, v13);
    else
      memset(&v45, 0, sizeof(v45));
    if (!CGAffineTransformIsIdentity(&v45))
    {
LABEL_16:
      *(float *)&v12 = v52;
      if (v52 <= 0.0 || (*(float *)&v12 = v53, v53 <= 0.0))
      {
        -[WKVideoLayerRemote resolveBounds](self, "resolveBounds", v12, v13);
      }
      else
      {
        v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v44.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v44.c = v16;
        *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        if (-[WKVideoLayerRemote resizePreservingGravity](self, "resizePreservingGravity"))
        {
          m_ptr = (unsigned __int8 *)self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
          if (m_ptr)
          {
            WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::RemoteMediaResource>(m_ptr, (uint64_t)self->_mediaPlayerPrivateRemote.m_objectOfCorrectType, &v43);
            v18 = v43;
            if (v43)
            {
              v19 = *(float *)(v43 + 340);
              v20 = *(float *)(v43 + 344);
              v43 = 0;
              WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v18 + 48));
              if (v19 > 0.0 && v20 > 0.0)
              {
                v22 = v19 / v20;
                WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v50, v22, v21);
                v50 = v23;
                v51 = v24;
                v52 = v25;
                v53 = v26;
                WebCore::largestRectWithAspectRatioInsideRect((WebCore *)&v46, v22, v27);
                v46 = v28;
                v47 = v29;
                v48 = v30;
                v49 = v31;
              }
            }
          }
          v32 = fmaxf(v48 / v52, v49 / v53);
          v33 = v32;
        }
        else
        {
          v32 = (float)(v48 / v52);
          v33 = (float)(v49 / v53);
        }
        CGAffineTransformMakeScale(&v44, v32, v33);
        v34 = (void *)objc_msgSend(v3, "objectAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[WKVideoLayerRemote bounds](self, "bounds");
        MidX = CGRectGetMidX(v54);
        -[WKVideoLayerRemote bounds](self, "bounds");
        objc_msgSend(v34, "setPosition:", MidX, CGRectGetMidY(v55));
        v42 = v44;
        objc_msgSend(v34, "setAffineTransform:", &v42);
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
        v36 = (void *)objc_msgSend(MEMORY[0x1E0CD2720], "currentContext");
        v37 = v36;
        if (v36)
          CFRetain(v36);
        v38 = self->_context.m_ptr;
        self->_context.m_ptr = v37;
        if (v38)
          CFRelease(v38);
        objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
        self->_delay.m_value = v39 + 0.1;
        value = self->_resolveBoundsTimer.__ptr_.__value_;
        if ((*((_QWORD *)value + 4) & 0xFFFFFFFFFFFFLL) == 0
          || *(double *)((*((_QWORD *)value + 4) & 0xFFFFFFFFFFFFLL) + 8) == 0.0)
        {
          WebCore::TimerBase::start();
        }
        else
        {
          self->_shouldRestartWhenTimerFires = 1;
          WebCore::TimerBase::nextFireInterval((WebCore::TimerBase *)value);
          self->_delay.m_value = self->_delay.m_value - v41;
        }
      }
    }
  }
}

- (void)resolveBounds
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  unsigned __int8 **v29;
  uint64_t v30;
  unsigned __int8 **v31;
  uint64_t v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  __int128 v36;
  _OWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  CGSize v40;
  int v41;
  _BYTE v42[4];
  CGAffineTransform v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (self->_shouldRestartWhenTimerFires)
  {
    self->_shouldRestartWhenTimerFires = 0;
    WebCore::TimerBase::start();
  }
  else
  {
    v3 = (void *)-[WKVideoLayerRemote sublayers](self, "sublayers");
    if (objc_msgSend(v3, "count") == 1)
    {
      v4 = (void *)objc_msgSend(v3, "objectAtIndex:", 0);
      -[WKVideoLayerRemote videoLayerFrame](self, "videoLayerFrame");
      if (CGRectIsEmpty(v44))
        goto LABEL_10;
      -[WKVideoLayerRemote videoLayerFrame](self, "videoLayerFrame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      objc_msgSend(v4, "bounds");
      v47.origin.x = v13;
      v47.origin.y = v14;
      v47.size.width = v15;
      v47.size.height = v16;
      v45.origin.x = v6;
      v45.origin.y = v8;
      v45.size.width = v10;
      v45.size.height = v12;
      if (!CGRectEqualToRect(v45, v47))
        goto LABEL_10;
      if (v4)
        objc_msgSend(v4, "affineTransform");
      else
        memset(&v43, 0, sizeof(v43));
      if (!CGAffineTransformIsIdentity(&v43))
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[WKVideoLayerRemote videoLayerFrame](self, "videoLayerFrame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        -[WKVideoLayerRemote bounds](self, "bounds");
        v48.origin.x = v25;
        v48.origin.y = v26;
        v48.size.width = v27;
        v48.size.height = v28;
        v46.origin.x = v18;
        v46.origin.y = v20;
        v46.size.width = v22;
        v46.size.height = v24;
        if (!CGRectEqualToRect(v46, v48))
        {
          -[WKVideoLayerRemote bounds](self, "bounds");
          -[WKVideoLayerRemote setVideoLayerFrame:](self, "setVideoLayerFrame:");
          v29 = -[WKVideoLayerRemote mediaPlayerPrivateRemote](self, "mediaPlayerPrivateRemote");
          if (v29)
          {
            v30 = (uint64_t)v29;
            v31 = v29 + 6;
            WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<WebKit::RemoteAudioHardwareListener,(WTF::DestructionThread)0>::ref(v29 + 6);
            WTF::MachSendRight::adopt((WTF::MachSendRight *)objc_msgSend(self->_context.m_ptr, "createFencePort"));
            -[WKVideoLayerRemote videoLayerFrame](self, "videoLayerFrame");
            v38 = v32;
            v39 = v33;
            v40.width = v34;
            v40.height = v35;
            WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v41, &v40);
            WebKit::MediaPlayerPrivateRemote::setVideoLayerSizeFenced(v30, &v41, (unint64_t)v42);
            WTF::MachSendRight::~MachSendRight((WTF::MachSendRight *)v42);
            WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::MediaPlayerPrivateRemote,(WTF::DestructionThread)1>(*v31);
          }
        }
        v36 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v37[0] = *MEMORY[0x1E0C9BAA8];
        v37[1] = v36;
        v37[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        objc_msgSend(v4, "setAffineTransform:", v37);
        -[WKVideoLayerRemote bounds](self, "bounds");
        objc_msgSend(v4, "setFrame:");
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
    }
  }
}

- (CGRect)videoLayerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoLayerFrame.origin.x;
  y = self->_videoLayerFrame.origin.y;
  width = self->_videoLayerFrame.size.width;
  height = self->_videoLayerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVideoLayerFrame:(CGRect)a3
{
  self->_videoLayerFrame = a3;
}

- (void).cxx_destruct
{
  Timer *value;
  void *m_ptr;
  unsigned __int8 *v5;

  value = self->_resolveBoundsTimer.__ptr_.__value_;
  self->_resolveBoundsTimer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Timer *, SEL))(*(_QWORD *)value + 8))(value, a2);
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = (unsigned __int8 *)self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr;
  self->_mediaPlayerPrivateRemote.m_controlBlock.m_ptr = 0;
  if (v5)
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref(v5, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (uint64_t)init
{
  void *v2;

  *a1 = off_1E34D0FE8;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)init
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "resolveBounds");
    CFRelease(v2);
  }
}

@end
