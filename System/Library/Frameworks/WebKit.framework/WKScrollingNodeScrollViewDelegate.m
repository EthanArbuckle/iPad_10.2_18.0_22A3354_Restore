@implementation WKScrollingNodeScrollViewDelegate

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (WKScrollingNodeScrollViewDelegate)initWithScrollingTreeNodeDelegate:(void *)a3
{
  void *v4;
  WKScrollingNodeScrollViewDelegate *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WKScrollingNodeScrollViewDelegate;
  v5 = -[WKScrollingNodeScrollViewDelegate init](&v15, sel_init);
  if (v5)
  {
    v6 = *((_QWORD *)a3 + 2);
    if (v6)
      goto LABEL_16;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((_QWORD *)a3 + 2);
    *((_QWORD *)a3 + 2) = v6;
    if (!v7)
      goto LABEL_16;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    v6 = *((_QWORD *)a3 + 2);
    if (v6)
    {
LABEL_16:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
    }
    m_ptr = (unsigned int *)v5->_scrollingTreeNodeDelegate.m_impl.m_ptr;
    v5->_scrollingTreeNodeDelegate.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v12 = __ldaxr(m_ptr);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, m_ptr));
      if (!v13)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  WebCore::ScrollingTreeScrollingNodeDelegate *v4;
  CGFloat v6;
  CGFloat v7;
  CGPoint v8;
  float v9[2];

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)m_ptr + 1);
    if (v4)
    {
      objc_msgSend(a3, "contentOffset");
      v8.x = v6;
      v8.y = v7;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v9, &v8);
      WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v4, (const WebCore::FloatPoint *)self->_inUserInteraction, v9[0], v9[1]);
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  DefaultWeakPtrImpl *v5;
  WebCore::ScrollingTreeScrollingNodeDelegate *v6;
  uint64_t v7;
  DefaultWeakPtrImpl *v8;
  WebCore::ScrollingTreeScrollingNodeDelegate *v9;
  uint64_t v10;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    self->_inUserInteraction = 1;
    if (objc_msgSend((id)objc_msgSend(a3, "panGestureRecognizer"), "state") == 1)
    {
      v5 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
      if (v5)
        v6 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)v5 + 1);
      else
        v6 = 0;
      v7 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v6);
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v7 + 168))(v7, *(_QWORD *)(*((_QWORD *)v6 + 1) + 48), *(_QWORD *)(*((_QWORD *)v6 + 1) + 56));
    }
    v8 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
    if (v8)
      v9 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)v8 + 1);
    else
      v9 = 0;
    v10 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v9);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v10 + 176))(v10, *(_QWORD *)(*((_QWORD *)v9 + 1) + 48), *(_QWORD *)(*((_QWORD *)v9 + 1) + 56));
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v9;
  int v10;
  id v12;
  char v13;
  char v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t v18;
  float Width;
  float Height;
  uint64_t v21;
  uint64_t v22;
  float v23;
  int v24;
  double x;
  double v26;
  uint64_t v27;
  float v28;
  int v29;
  double y;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  float v47;
  float v48;
  CGRect v49;
  CGRect v50;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    if ((objc_msgSend(a3, "isZooming") & 1) == 0)
    {
      v9 = *((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1);
      v10 = *(unsigned __int8 *)(v9 + 48);
      *(_BYTE *)(v9 + 48) = 0;
      if (v10 && (v10 & 5) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = a3;
        else
          v12 = 0;
        v13 = objc_msgSend(v12, "axesToPreventMomentumScrolling");
        v14 = v13;
        if ((v10 & 8) == 0 || (v13 & 1) != 0)
        {
          objc_msgSend(a3, "contentOffset");
          a5->x = v15;
        }
        if ((v10 & 0x10) == 0 || (v14 & 2) != 0)
        {
          objc_msgSend(a3, "contentOffset");
          a5->y = v16;
        }
      }
    }
    v17 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    v18 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    objc_msgSend(a3, "bounds");
    Width = CGRectGetWidth(v49);
    objc_msgSend(a3, "bounds");
    Height = CGRectGetHeight(v50);
    v47 = Width;
    v48 = Height;
    v21 = WebCore::ScrollingTreeScrollingNode::snapOffsetsInfo(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    if (*(_DWORD *)(v21 + 20))
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v44, a5);
      objc_msgSend(a3, "contentOffset");
      v22 = WebCore::ScrollSnapOffsetsInfo<float,WebCore::FloatRect>::closestSnapOffset<WebCore::FloatSize,WebCore::FloatPoint>();
      v23 = *(float *)&v22;
      v45 = v22;
      v46 = v24;
      WebCore::ScrollingTreeScrollingNode::setCurrentHorizontalSnapPointIndex();
      x = a5->x;
      if (a5->x >= 0.0)
      {
        objc_msgSend(a3, "contentSize");
        if (x <= v26)
          a5->x = v23;
      }
    }
    if (*(_DWORD *)(v21 + 36))
    {
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v43, a5);
      objc_msgSend(a3, "contentOffset");
      v27 = WebCore::ScrollSnapOffsetsInfo<float,WebCore::FloatRect>::closestSnapOffset<WebCore::FloatSize,WebCore::FloatPoint>();
      v28 = *(float *)&v27;
      v45 = v27;
      v46 = v29;
      WebCore::ScrollingTreeScrollingNode::setCurrentVerticalSnapPointIndex();
      y = a5->y;
      if (y >= 0.0)
      {
        objc_msgSend(a3, "contentSize");
        if (y <= v31)
          a5->y = v28;
      }
    }
    v32 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    v33 = v32 & 0xFF00000000;
    if ((v17 & 0xFF00000000) == 0 || v33 == 0)
    {
      if (((v17 & 0xFF00000000) != 0) == (v33 != 0))
        goto LABEL_34;
    }
    else if ((_DWORD)v17 == (_DWORD)v32)
    {
LABEL_34:
      v35 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
      v36 = v35 & 0xFF00000000;
      if ((v18 & 0xFF00000000) == 0 || v36 == 0)
      {
        if (((v18 & 0xFF00000000) != 0) == (v36 != 0))
          return;
      }
      else if ((_DWORD)v18 == (_DWORD)v35)
      {
        return;
      }
    }
    v38 = *((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1);
    v39 = WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(v38 + 8));
    v40 = WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(*(WebCore::ScrollingTreeScrollingNode **)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 8));
    if (!*(_BYTE *)(v38 + 49))
    {
      v41 = v40;
      v42 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree((WebCore::ScrollingTreeScrollingNodeDelegate *)v38);
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v42 + 240))(v42, *(_QWORD *)(*(_QWORD *)(v38 + 8) + 48), *(_QWORD *)(*(_QWORD *)(v38 + 8) + 56), v39, v41);
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  DefaultWeakPtrImpl *m_ptr;
  WebCore::ScrollingTreeScrollingNodeDelegate *v5;
  CGFloat v7;
  CGFloat v8;
  DefaultWeakPtrImpl *v9;
  WebCore::ScrollingTreeScrollingNodeDelegate *v10;
  uint64_t v11;
  CGPoint v12;
  float v13[2];

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)m_ptr + 1);
    if (v5)
    {
      if (self->_inUserInteraction && !a4)
      {
        self->_inUserInteraction = 0;
        objc_msgSend(a3, "contentOffset");
        v12.x = v7;
        v12.y = v8;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v13, &v12);
        WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v5, (const WebCore::FloatPoint *)self->_inUserInteraction, v13[0], v13[1]);
        v9 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
        if (v9)
          v10 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)v9 + 1);
        else
          v10 = 0;
        v11 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v10);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v11 + 184))(v11, *(_QWORD *)(*((_QWORD *)v10 + 1) + 48), *(_QWORD *)(*((_QWORD *)v10 + 1) + 56));
      }
    }
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  WebCore::ScrollingTreeScrollingNodeDelegate *v4;
  CGFloat v6;
  CGFloat v7;
  DefaultWeakPtrImpl *v8;
  WebCore::ScrollingTreeScrollingNodeDelegate *v9;
  uint64_t v10;
  CGPoint v11;
  float v12[2];

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)m_ptr + 1);
    if (v4)
    {
      if (self->_inUserInteraction)
      {
        self->_inUserInteraction = 0;
        objc_msgSend(a3, "contentOffset");
        v11.x = v6;
        v11.y = v7;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v11);
        WebKit::ScrollingTreeScrollingNodeDelegateIOS::scrollViewDidScroll(v4, (const WebCore::FloatPoint *)self->_inUserInteraction, v12[0], v12[1]);
        v8 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
        if (v8)
          v9 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)v8 + 1);
        else
          v9 = 0;
        v10 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v9);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v10 + 184))(v10, *(_QWORD *)(*((_QWORD *)v9 + 1) + 48), *(_QWORD *)(*((_QWORD *)v9 + 1) + 56));
      }
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;
  uint64_t v5;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 1);
    if (v4)
    {
      v5 = WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(*((WebCore::ScrollingTreeScrollingNodeDelegate **)m_ptr
                                                                      + 1));
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v5 + 184))(v5, *(_QWORD *)(*(_QWORD *)(v4 + 8) + 48), *(_QWORD *)(*(_QWORD *)(v4 + 8) + 56));
    }
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  -[WKScrollingNodeScrollViewDelegate cancelPointersForGestureRecognizer:](self, "cancelPointersForGestureRecognizer:", objc_msgSend(a3, "pinchGestureRecognizer"));
}

- (void)cancelPointersForGestureRecognizer:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  WebCore::ScrollingTreeScrollingNodeDelegate *v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)m_ptr + 1);
    if (v4)
    {
      v6 = (_QWORD *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v4);
      if (((*(uint64_t (**)(_QWORD *))(*v6 + 32))(v6) & 1) != 0)
      {
        v7 = v6[43];
        if (v7)
        {
          v8 = *(_QWORD *)(v7 + 8);
          if (v8)
          {
            v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 16) + 40) + 8);
            (*(void (**)(uint64_t, id))(*(_QWORD *)v9 + 1760))(v9, a3);
          }
        }
      }
      else
      {
        __break(0xC471u);
      }
    }
  }
}

- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  void *v6;
  DefaultWeakPtrImpl *v7;
  WebCore::ScrollingTreeScrollingNodeDelegate *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _BOOL8 v20;
  double v21;
  double v22;
  unint64_t result;
  int v24;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (!m_ptr || !*((_QWORD *)m_ptr + 1))
    return 0;
  v6 = (void *)objc_msgSend(a3, "panGestureRecognizer");
  v7 = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (v7)
    v8 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)v7 + 1);
  else
    v8 = 0;
  v9 = (_QWORD *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v8);
  if (((*(uint64_t (**)(_QWORD *))(*v9 + 32))(v9) & 1) != 0)
  {
    v10 = v9[43];
    if (v10)
    {
      v11 = *(_QWORD *)(v10 + 8);
      if (v11)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v11 + 16) + 40) + 8);
        v13 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)v12 + 1768))(v12, v6);
        if ((v13 & 0xFF00000000) != 0)
        {
          v24 = v13;
          v14 = WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,WTF::OptionSet<WebCore::TouchAction>>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned int,WTF::OptionSet<WebCore::TouchAction>,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<WTF::OptionSet<WebCore::TouchAction>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned int>>,unsigned int>((uint64_t *)(v11 + 144), &v24);
          v15 = *(_QWORD *)(v11 + 144);
          if (v15)
            v15 += 8 * *(unsigned int *)(v15 - 4);
          if (v15 == v14)
            v16 = 0;
          else
            v16 = *(_BYTE *)(v14 + 4);
          *((_BYTE *)v8 + 48) = v16;
        }
      }
    }
    v17 = *(_BYTE *)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48);
    if (v17)
    {
      if ((*(_BYTE *)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48) & 5) != 0)
        return 0;
      v20 = (v17 & 8) == 0;
      v18 = v20 | 2;
      if ((*(_BYTE *)(*((_QWORD *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr + 1) + 48) & 0x10) != 0)
        v19 = (v17 & 8) == 0;
      else
        v19 = v20 | 2;
      objc_msgSend(v6, "translationInView:", a3);
      if ((v17 & 8) == 0 || fabs(v21) <= 2.22044605e-16)
      {
        if ((v17 & 0x10) == 0)
          return v18;
        v19 = (v17 & 8) == 0;
        v18 = v19;
        if (fabs(v22) <= 2.22044605e-16)
          return v18;
      }
    }
    else
    {
      v19 = 0;
    }
    -[WKScrollingNodeScrollViewDelegate cancelPointersForGestureRecognizer:](self, "cancelPointersForGestureRecognizer:", v6);
    return v19;
  }
  result = 96;
  __break(0xC471u);
  return result;
}

- (id)parentScrollViewForScrollView:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  id result;
  _QWORD *v6;
  const WebKit::RemoteLayerTreeHost *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *ActingScrollParent;
  UIScrollView *v12;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (!m_ptr)
    return 0;
  result = (id)*((_QWORD *)m_ptr + 1);
  if (result)
  {
    v6 = (_QWORD *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree((WebCore::ScrollingTreeScrollingNodeDelegate *)result);
    if (((*(uint64_t (**)(_QWORD *))(*v6 + 32))(v6) & 1) != 0)
    {
      v8 = v6[43];
      if (v8
        && (v9 = *(_QWORD *)(v8 + 8)) != 0
        && (v10 = *(_QWORD *)(*(_QWORD *)(v9 + 16) + 184)) != 0
        && !*(_BYTE *)(v10 + 32)
        && (v12 = *(UIScrollView **)(v10 + 72)) != 0)
      {
        ActingScrollParent = (void *)WebKit::findActingScrollParent((WebKit *)a3, v12, v7);
      }
      else
      {
        ActingScrollParent = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return ActingScrollParent;
      else
        return 0;
    }
    else
    {
      result = (id)96;
      __break(0xC471u);
    }
  }
  return result;
}

- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  WebCore::ScrollingTreeScrollingNodeDelegate *v6;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  m_ptr = self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = (WebCore::ScrollingTreeScrollingNodeDelegate *)*((_QWORD *)m_ptr + 1);
    if (v6)
    {
      v10 = (_QWORD *)WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(v6);
      if (((*(uint64_t (**)(_QWORD *))(*v10 + 32))(v10) & 1) != 0)
      {
        v11 = v10[43];
        if (v11)
        {
          v12 = *(_QWORD *)(v11 + 8);
          if (v12)
          {
            v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v12 + 16) + 40) + 8);
            (*(void (**)(uint64_t, id, id, id))(*(_QWORD *)v13 + 1120))(v13, a3, a4, a5);
          }
        }
      }
      else
      {
        __break(0xC471u);
      }
    }
  }
}

- (BOOL)_isInUserInteraction
{
  return self->_inUserInteraction;
}

- (void)setInUserInteraction:(BOOL)a3
{
  self->_inUserInteraction = a3;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_scrollingTreeNodeDelegate.m_impl.m_ptr;
  self->_scrollingTreeNodeDelegate.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

@end
