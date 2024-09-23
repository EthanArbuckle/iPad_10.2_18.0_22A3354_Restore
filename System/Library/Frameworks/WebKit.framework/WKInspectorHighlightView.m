@implementation WKInspectorHighlightView

- (WKInspectorHighlightView)initWithFrame:(CGRect)a3
{
  WKInspectorHighlightView *v3;
  id v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKInspectorHighlightView;
  v3 = -[WKInspectorHighlightView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    m_ptr = v3->_layers.m_ptr;
    v3->_layers.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WKInspectorHighlightView setOpaque:](v3, "setOpaque:", 0);
    -[WKInspectorHighlightView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WKInspectorHighlightView _removeAllLayers](self, "_removeAllLayers");
  v3.receiver = self;
  v3.super_class = (Class)WKInspectorHighlightView;
  -[WKInspectorHighlightView dealloc](&v3, sel_dealloc);
}

- (void)_removeAllLayers
{
  void *m_ptr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  m_ptr = self->_layers.m_ptr;
  v4 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(m_ptr);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "removeFromSuperlayer");
      }
      v5 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(self->_layers.m_ptr, "removeAllObjects");
}

- (void)_createLayers:(unint64_t)a3
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;

  v5 = objc_msgSend(self->_layers.m_ptr, "count");
  if (a3 && v5 != a3)
  {
    do
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CD2840]);
      -[WKInspectorHighlightView frame](self, "frame");
      v8 = v7;
      -[WKInspectorHighlightView frame](self, "frame");
      objc_msgSend(v6, "setPosition:", -v8, -v9);
      objc_msgSend(self->_layers.m_ptr, "addObject:", v6);
      objc_msgSend((id)-[WKInspectorHighlightView layer](self, "layer"), "addSublayer:", v6);
      if (v6)
        CFRelease(v6);
      --a3;
    }
    while (a3);
  }
}

- (void)_layoutForNodeHighlight:(const void *)a3 offset:(unsigned int)a4
{
  unint64_t v7;
  unint64_t v8;
  CAShapeLayer *v9;
  uint64_t v10;
  CAShapeLayer *v11;
  uint64_t v12;
  CAShapeLayer *v13;
  uint64_t v14;
  uint64_t v15;
  const Color *v16;
  unsigned int v17;
  uint64_t v18;
  _OWORD *v19;
  __int128 v20;
  _OWORD *v21;
  __int128 v22;
  _OWORD *v23;
  __int128 v24;
  CAShapeLayer *v25;
  _OWORD *v26;
  __int128 v27;
  const Color *v28;
  const Color *v29;
  const Color *v30;
  CFTypeRef cf;
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];

  v7 = objc_msgSend(self->_layers.m_ptr, "count");
  v8 = a4 + 4;
  if (v7 >= v8 && *((_DWORD *)a3 + 15) >= v8)
  {
    v9 = (CAShapeLayer *)objc_msgSend(self->_layers.m_ptr, "objectAtIndex:", a4);
    v10 = a4 + 1;
    v11 = (CAShapeLayer *)objc_msgSend(self->_layers.m_ptr, "objectAtIndex:", v10);
    v12 = a4 + 2;
    v13 = (CAShapeLayer *)objc_msgSend(self->_layers.m_ptr, "objectAtIndex:", v12);
    v14 = a4 + 3;
    v15 = objc_msgSend(self->_layers.m_ptr, "objectAtIndex:", v14);
    v17 = *((_DWORD *)a3 + 15);
    if (v17 <= a4)
      goto LABEL_14;
    v18 = *((_QWORD *)a3 + 6);
    v19 = (_OWORD *)(v18 + 32 * a4);
    v20 = v19[1];
    v35[0] = *v19;
    v35[1] = v20;
    if (v17 <= v10)
    {
      __break(0xC471u);
      JUMPOUT(0x19724C140);
    }
    v21 = (_OWORD *)(v18 + 32 * v10);
    v22 = v21[1];
    v34[0] = *v21;
    v34[1] = v22;
    if (v17 <= v12)
    {
      __break(0xC471u);
      JUMPOUT(0x19724C148);
    }
    v23 = (_OWORD *)(v18 + 32 * v12);
    v24 = v23[1];
    v33[0] = *v23;
    v33[1] = v24;
    if (v17 <= v14)
    {
LABEL_14:
      __break(0xC471u);
      JUMPOUT(0x19724C138);
    }
    v25 = (CAShapeLayer *)v15;
    v26 = (_OWORD *)(v18 + 32 * v14);
    v27 = v26[1];
    v32[0] = *v26;
    v32[1] = v27;
    WebCore::cachedCGColor((WebCore *)((char *)a3 + 32), v16);
    -[CAShapeLayer setFillColor:](v9, "setFillColor:", cf);
    if (cf)
      CFRelease(cf);
    WebCore::cachedCGColor((WebCore *)((char *)a3 + 24), v28);
    -[CAShapeLayer setFillColor:](v11, "setFillColor:", 0);
    WebCore::cachedCGColor((WebCore *)((char *)a3 + 16), v29);
    -[CAShapeLayer setFillColor:](v13, "setFillColor:", 0);
    WebCore::cachedCGColor((WebCore *)a3, v30);
    -[CAShapeLayer setFillColor:](v25, "setFillColor:", 0);
    layerPathWithHole(v9, (const WebCore::FloatQuad *)v35, (const WebCore::FloatQuad *)v34);
    layerPathWithHole(v11, (const WebCore::FloatQuad *)v34, (const WebCore::FloatQuad *)v33);
    layerPathWithHole(v13, (const WebCore::FloatQuad *)v33, (const WebCore::FloatQuad *)v32);
    layerPath(v25, (const WebCore::FloatQuad *)v32);
  }
}

- (void)_layoutForNodeListHighlight:(const void *)a3
{
  unsigned int v3;
  uint64_t v6;
  unsigned int v7;

  v3 = *((_DWORD *)a3 + 15);
  if (v3)
  {
    -[WKInspectorHighlightView _createLayers:](self, "_createLayers:", v3 & 0xFFFFFFFC);
    if (v3 >= 4)
    {
      v6 = 0;
      v7 = v3 >> 2;
      do
      {
        -[WKInspectorHighlightView _layoutForNodeHighlight:offset:](self, "_layoutForNodeHighlight:offset:", a3, v6);
        v6 = (v6 + 4);
        --v7;
      }
      while (v7);
    }
  }
}

- (void)_layoutForRectsHighlight:(const void *)a3
{
  uint64_t v3;
  const Color *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  CAShapeLayer *v10;
  CFTypeRef cf;

  v3 = *((unsigned int *)a3 + 15);
  if ((_DWORD)v3)
  {
    -[WKInspectorHighlightView _createLayers:](self, "_createLayers:", *((unsigned int *)a3 + 15));
    WebCore::cachedCGColor((WebCore *)a3, v6);
    v7 = 0;
    v8 = 0;
    v9 = 32 * v3;
    do
    {
      v10 = (CAShapeLayer *)objc_msgSend(self->_layers.m_ptr, "objectAtIndex:", v8);
      -[CAShapeLayer setFillColor:](v10, "setFillColor:", cf);
      if (v8 >= *((unsigned int *)a3 + 15))
      {
        __break(0xC471u);
        return;
      }
      layerPath(v10, (const WebCore::FloatQuad *)(*((_QWORD *)a3 + 6) + v7));
      ++v8;
      v7 += 32;
    }
    while (v9 != v7);
    if (cf)
      CFRelease(cf);
  }
}

- (void)drawRect:(CGRect)a3
{
  optional<WebCore::InspectorOverlayHighlight> *p_highlight;
  double v5;
  double v6;
  float v7;
  double v8;
  unsigned int m_size;
  GridHighlightOverlay *m_buffer;
  GridHighlightOverlay *v11;
  const GridHighlightOverlay *v12;
  void *v13;
  void *v14;
  void *v15;
  WTF *v16;
  WTF *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  const FlexHighlightOverlay *v22;
  uint64_t v23;
  const FlexHighlightOverlay *v24;
  void *v25;
  FloatRect v26;
  int v27;
  WTF *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v32;
  CGRect v33;
  _BYTE v34[752];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WKInspectorHighlightView;
  -[WKInspectorHighlightView drawRect:](&v32, sel_drawRect_);
  p_highlight = &self->_highlight;
  if (self->_highlight.__engaged_)
  {
    UIGraphicsGetCurrentContext();
    WebCore::GraphicsContextCG::GraphicsContextCG();
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v26, &v33);
    WebCore::GraphicsContextCG::clip((WebCore::GraphicsContextCG *)v34, &v26);
    -[WKInspectorHighlightView frame](self, "frame");
    v6 = v5;
    -[WKInspectorHighlightView frame](self, "frame");
    v7 = v6;
    *(float *)&v8 = v8;
    WebCore::GraphicsContextCG::translate((WebCore::GraphicsContextCG *)v34, -v7, -*(float *)&v8);
    if (!self->_highlight.__engaged_)
      goto LABEL_22;
    m_size = self->_highlight.var0.__val_.gridHighlightOverlays.m_size;
    if (m_size)
    {
      m_buffer = self->_highlight.var0.__val_.gridHighlightOverlays.m_buffer;
      v11 = (GridHighlightOverlay *)((char *)m_buffer + 72 * m_size);
      do
      {
        WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay((WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)&v26, (const Color *)m_buffer);
        WebCore::InspectorOverlay::drawGridOverlay((WebCore::InspectorOverlay *)v34, (WebCore::GraphicsContext *)&v26, v12);
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v31, v13);
        WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v30, v14);
        v16 = v28;
        if (v28)
        {
          v28 = 0;
          v29 = 0;
          WTF::fastFree(v16, v15);
        }
        v17 = (WTF *)v26.m_size;
        if (v26.m_size)
        {
          v26.m_size = 0;
          v27 = 0;
          WTF::fastFree(v17, v15);
        }
        if ((*(_QWORD *)&v26.m_location & 0x8000000000000) != 0)
        {
          v18 = (unsigned int *)(*(_QWORD *)&v26.m_location & 0xFFFFFFFFFFFFLL);
          do
          {
            v19 = __ldaxr(v18);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v18));
          if (!v20)
          {
            atomic_store(1u, v18);
            WTF::fastFree((WTF *)v18, v15);
          }
        }
        m_buffer = (GridHighlightOverlay *)((char *)m_buffer + 72);
      }
      while (m_buffer != v11);
      if (!p_highlight->__engaged_)
LABEL_22:
        __break(1u);
    }
    v21 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    if ((_DWORD)v21)
    {
      v22 = p_highlight->var0.__val_.flexHighlightOverlays.m_buffer;
      v23 = 136 * v21;
      do
      {
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay((WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)&v26, v22);
        WebCore::InspectorOverlay::drawFlexOverlay((WebCore::InspectorOverlay *)v34, (WebCore::GraphicsContext *)&v26, v24);
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::~FlexHighlightOverlay((WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)&v26, v25);
        v22 = (const FlexHighlightOverlay *)((char *)v22 + 136);
        v23 -= 136;
      }
      while (v23);
    }
    WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v34);
  }
}

- (void)update:(const void *)a3 scale:(double)a4 frame:(const FloatRect *)a5
{
  optional<WebCore::InspectorOverlayHighlight> *p_highlight;
  void *v9;
  Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_gridHighlightOverlays;
  unsigned int m_size;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  WebCore::InspectorOverlayHighlight::GridHighlightOverlay *v15;
  uint64_t v16;
  const Color *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *v21;
  uint64_t v22;
  const FlexHighlightOverlay *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  GridHighlightOverlay *m_buffer;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  __int128 v50;
  unsigned int v51;
  WebCore::InspectorOverlayHighlight::GridHighlightOverlay *v52;
  const Color *v53;
  uint64_t v54;
  Vector<WebCore::InspectorOverlayHighlight::FlexHighlightOverlay, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_flexHighlightOverlays;
  unsigned int v56;
  uint64_t v57;
  WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  FlexHighlightOverlay *v64;
  __int128 v65;
  unsigned int v66;
  unsigned int v67;
  WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *v68;
  const FlexHighlightOverlay *v69;
  uint64_t v70;
  double v71;
  int v72;
  WKInspectorHighlightView *v73;

  -[WKInspectorHighlightView _removeAllLayers](self, "_removeAllLayers");
  v73 = self;
  p_highlight = &self->_highlight;
  if (!p_highlight->__engaged_)
  {
    WebCore::Color::Color((WebCore::Color *)p_highlight, (const Color *)a3);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.contentOutlineColor, (const Color *)a3 + 1);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.paddingColor, (const Color *)a3 + 2);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.borderColor, (const Color *)a3 + 3);
    WebCore::Color::Color((WebCore::Color *)&p_highlight->var0.__val_.marginColor, (const Color *)a3 + 4);
    p_highlight->var0.__val_.type = *((_BYTE *)a3 + 40);
    WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&p_highlight->var0.__val_.quads, (uint64_t)a3 + 48);
    v13 = *((unsigned int *)a3 + 19);
    p_highlight->var0.__val_.gridHighlightOverlays.m_buffer = 0;
    *(_QWORD *)&p_highlight->var0.__val_.gridHighlightOverlays.m_capacity = 0;
    p_highlight->var0.__val_.gridHighlightOverlays.m_size = v13;
    if ((_DWORD)v13)
    {
      if (v13 >= 0x38E38E4)
        goto LABEL_76;
      v14 = 72 * v13;
      v15 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)WTF::fastMalloc((WTF *)(72 * v13));
      p_highlight->var0.__val_.gridHighlightOverlays.m_capacity = v14 / 0x48;
      p_highlight->var0.__val_.gridHighlightOverlays.m_buffer = (GridHighlightOverlay *)v15;
      v16 = *((unsigned int *)a3 + 19);
      if ((_DWORD)v16)
      {
        v17 = (const Color *)*((_QWORD *)a3 + 8);
        v18 = 72 * v16;
        do
        {
          v15 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay(v15, v17)+ 72);
          v17 += 9;
          v18 -= 72;
        }
        while (v18);
      }
    }
    v19 = *((unsigned int *)a3 + 23);
    p_highlight->var0.__val_.flexHighlightOverlays.m_buffer = 0;
    *(_QWORD *)&p_highlight->var0.__val_.flexHighlightOverlays.m_capacity = 0;
    p_highlight->var0.__val_.flexHighlightOverlays.m_size = v19;
    if (!(_DWORD)v19)
    {
LABEL_15:
      p_highlight->var0.__val_.usePageCoordinates = *((_BYTE *)a3 + 96);
      p_highlight->__engaged_ = 1;
      goto LABEL_71;
    }
    if (v19 < 0x1E1E1E2)
    {
      v20 = 136 * v19;
      v21 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)WTF::fastMalloc((WTF *)(136 * v19));
      p_highlight->var0.__val_.flexHighlightOverlays.m_capacity = v20 / 0x88;
      p_highlight->var0.__val_.flexHighlightOverlays.m_buffer = (FlexHighlightOverlay *)v21;
      v22 = *((unsigned int *)a3 + 23);
      if ((_DWORD)v22)
      {
        v23 = (const FlexHighlightOverlay *)*((_QWORD *)a3 + 10);
        v24 = 136 * v22;
        do
        {
          v21 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay(v21, v23)+ 136);
          v23 = (const FlexHighlightOverlay *)((char *)v23 + 136);
          v24 -= 136;
        }
        while (v24);
      }
      goto LABEL_15;
    }
LABEL_76:
    __break(0xC471u);
    JUMPOUT(0x19724D188);
  }
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  WebCore::Color::operator=();
  p_highlight->var0.__val_.type = *((_BYTE *)a3 + 40);
  WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)&p_highlight->var0.__val_.quads, (uint64_t)a3 + 48);
  if (p_highlight != a3)
  {
    p_gridHighlightOverlays = &p_highlight->var0.__val_.gridHighlightOverlays;
    m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
    v12 = *((_DWORD *)a3 + 19);
    if (m_size <= v12)
    {
      if (v12 > p_highlight->var0.__val_.gridHighlightOverlays.m_capacity)
      {
        WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&p_highlight->var0.__val_.gridHighlightOverlays, 0);
        WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&p_highlight->var0.__val_.gridHighlightOverlays, *((unsigned int *)a3 + 19));
        m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
      }
    }
    else
    {
      WTF::VectorDestructor<true,WebCore::InspectorOverlayHighlight::GridHighlightOverlay>::destruct((WTF *)((char *)p_highlight->var0.__val_.gridHighlightOverlays.m_buffer + 72 * v12), (WTF *)((char *)p_highlight->var0.__val_.gridHighlightOverlays.m_buffer + 72 * m_size));
      p_highlight->var0.__val_.gridHighlightOverlays.m_size = v12;
      m_size = v12;
    }
    v25 = *((_QWORD *)a3 + 8);
    if (m_size)
    {
      v26 = v25 + 72 * m_size;
      m_buffer = p_gridHighlightOverlays->m_buffer;
      do
      {
        WebCore::Color::operator=();
        if ((GridHighlightOverlay *)v25 != m_buffer)
        {
          v28 = *((unsigned int *)m_buffer + 5);
          v29 = *(unsigned int *)(v25 + 20);
          if (v28 <= v29)
          {
            if (v29 > *((unsigned int *)m_buffer + 4))
            {
              WTF::Vector<WebCore::FloatLine,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)m_buffer + 8, 0);
              WTF::Vector<WebCore::FloatLine,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)m_buffer + 8, *(unsigned int *)(v25 + 20));
              v28 = *((unsigned int *)m_buffer + 5);
            }
          }
          else
          {
            *((_DWORD *)m_buffer + 5) = v29;
            v28 = v29;
          }
          if (v28)
          {
            memmove(*((void **)m_buffer + 1), *(const void **)(v25 + 8), 20 * v28);
            v28 = *((unsigned int *)m_buffer + 5);
          }
          v30 = *(unsigned int *)(v25 + 20);
          if (v28 != v30)
          {
            v31 = 5 * v28;
            v32 = *((_QWORD *)m_buffer + 1) + 20 * v28;
            v33 = *(_QWORD *)(v25 + 8) + 4 * v31;
            v34 = 20 * v30 - 4 * v31;
            do
            {
              v35 = *(_OWORD *)v33;
              *(_DWORD *)(v32 + 16) = *(_DWORD *)(v33 + 16);
              *(_OWORD *)v32 = v35;
              v32 += 20;
              v33 += 20;
              v34 -= 20;
            }
            while (v34);
            LODWORD(v28) = *(_DWORD *)(v25 + 20);
          }
          *((_DWORD *)m_buffer + 5) = v28;
          WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)m_buffer + 24, v25 + 24);
          v36 = (uint64_t *)((char *)m_buffer + 40);
          v37 = *((unsigned int *)m_buffer + 13);
          v38 = *(unsigned int *)(v25 + 52);
          if (v37 <= v38)
          {
            if (v38 > *((unsigned int *)m_buffer + 12))
            {
              WTF::Vector<WebCore::InspectorOverlayHighlight::GridHighlightOverlay::Area,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)m_buffer + 10, 0);
              WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)m_buffer + 40, *(unsigned int *)(v25 + 52));
              v37 = *((unsigned int *)m_buffer + 13);
            }
          }
          else
          {
            WTF::VectorDestructor<true,WTF::URL>::destruct((WTF::StringImpl *)(*((_QWORD *)m_buffer + 5) + 40 * v38), (WTF::StringImpl *)(*((_QWORD *)m_buffer + 5) + 40 * v37));
            *((_DWORD *)m_buffer + 13) = v38;
            v37 = v38;
          }
          v39 = *(_QWORD *)(v25 + 40);
          if (v37)
          {
            v40 = v39 + 40 * v37;
            v41 = *v36;
            do
            {
              WTF::String::operator=((WTF::StringImpl **)v41, (WTF::StringImpl *)v39);
              v42 = *(_OWORD *)(v39 + 24);
              *(_OWORD *)(v41 + 8) = *(_OWORD *)(v39 + 8);
              *(_OWORD *)(v41 + 24) = v42;
              v39 += 40;
              v41 += 40;
            }
            while (v39 != v40);
            v39 = *(_QWORD *)(v25 + 40);
            v43 = *((unsigned int *)m_buffer + 13);
          }
          else
          {
            v43 = 0;
          }
          v44 = *(unsigned int *)(v25 + 52);
          if (v43 != v44)
          {
            v45 = v39 + 40 * v44;
            v46 = 5 * v43;
            v47 = *v36 + 40 * v43;
            v48 = v39 + 8 * v46;
            do
            {
              v49 = *(_DWORD **)v48;
              if (*(_QWORD *)v48)
                *v49 += 2;
              *(_QWORD *)v47 = v49;
              v50 = *(_OWORD *)(v48 + 8);
              *(_OWORD *)(v47 + 24) = *(_OWORD *)(v48 + 24);
              *(_OWORD *)(v47 + 8) = v50;
              v48 += 40;
              v47 += 40;
            }
            while (v48 != v45);
            LODWORD(v43) = *(_DWORD *)(v25 + 52);
          }
          *((_DWORD *)m_buffer + 13) = v43;
        }
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)m_buffer + 14, (unsigned int *)(v25 + 56));
        v25 += 72;
        m_buffer = (GridHighlightOverlay *)((char *)m_buffer + 72);
      }
      while (v25 != v26);
      v25 = *((_QWORD *)a3 + 8);
      m_size = p_highlight->var0.__val_.gridHighlightOverlays.m_size;
      p_gridHighlightOverlays = &p_highlight->var0.__val_.gridHighlightOverlays;
    }
    v51 = *((_DWORD *)a3 + 19);
    if (m_size != v51)
    {
      v52 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)p_gridHighlightOverlays->m_buffer
                                                                       + 72 * m_size);
      v53 = (const Color *)(v25 + 72 * m_size);
      v54 = 72 * v51 - 72 * m_size;
      do
      {
        v52 = (WebCore::InspectorOverlayHighlight::GridHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::GridHighlightOverlay::GridHighlightOverlay(v52, v53)+ 72);
        v53 += 9;
        v54 -= 72;
      }
      while (v54);
      m_size = *((_DWORD *)a3 + 19);
    }
    p_highlight->var0.__val_.gridHighlightOverlays.m_size = m_size;
    p_flexHighlightOverlays = &p_highlight->var0.__val_.flexHighlightOverlays;
    v56 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    v57 = *((unsigned int *)a3 + 23);
    if (v56 <= v57)
    {
      v61 = v57 > p_highlight->var0.__val_.flexHighlightOverlays.m_capacity;
      LODWORD(v57) = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
      if (v61)
      {
        WTF::Vector<WebCore::InspectorOverlayHighlight::FlexHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((uint64_t)&p_highlight->var0.__val_.flexHighlightOverlays, 0);
        WTF::Vector<WebCore::InspectorOverlayHighlight::FlexHighlightOverlay,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&p_highlight->var0.__val_.flexHighlightOverlays, *((unsigned int *)a3 + 23));
        LODWORD(v57) = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
      }
    }
    else
    {
      v58 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)p_flexHighlightOverlays->m_buffer
                                                                       + 136 * v57);
      v59 = 136 * v56 - 136 * v57;
      do
      {
        WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::~FlexHighlightOverlay(v58, v9);
        v58 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)(v60 + 136);
        v59 -= 136;
      }
      while (v59);
      p_highlight->var0.__val_.flexHighlightOverlays.m_size = v57;
    }
    v62 = *((_QWORD *)a3 + 10);
    if ((_DWORD)v57)
    {
      v63 = v62 + 136 * v57;
      v64 = p_flexHighlightOverlays->m_buffer;
      do
      {
        WebCore::Color::operator=();
        v65 = *(_OWORD *)(v62 + 24);
        *(_OWORD *)((char *)v64 + 8) = *(_OWORD *)(v62 + 8);
        *(_OWORD *)((char *)v64 + 24) = v65;
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 40, v62 + 40);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 56, v62 + 56);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 72, v62 + 72);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 88, v62 + 88);
        WTF::Vector<WebCore::PlatformTimeRanges::Range,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)v64 + 104, v62 + 104);
        WTF::Vector<WebCore::InspectorOverlayLabel,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)v64 + 30, (unsigned int *)(v62 + 120));
        v62 += 136;
        v64 = (FlexHighlightOverlay *)((char *)v64 + 136);
      }
      while (v62 != v63);
      v62 = *((_QWORD *)a3 + 10);
      v66 = p_highlight->var0.__val_.flexHighlightOverlays.m_size;
    }
    else
    {
      v66 = 0;
    }
    v67 = *((_DWORD *)a3 + 23);
    if (v66 != v67)
    {
      v68 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)p_flexHighlightOverlays->m_buffer
                                                                       + 136 * v66);
      v69 = (const FlexHighlightOverlay *)(v62 + 136 * v66);
      v70 = 136 * v67 - 136 * v66;
      do
      {
        v68 = (WebCore::InspectorOverlayHighlight::FlexHighlightOverlay *)((char *)WebCore::InspectorOverlayHighlight::FlexHighlightOverlay::FlexHighlightOverlay(v68, v69)+ 136);
        v69 = (const FlexHighlightOverlay *)((char *)v69 + 136);
        v70 -= 136;
      }
      while (v70);
      v66 = *((_DWORD *)a3 + 23);
    }
    p_highlight->var0.__val_.flexHighlightOverlays.m_size = v66;
  }
  p_highlight->var0.__val_.usePageCoordinates = *((_BYTE *)a3 + 96);
LABEL_71:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
  -[WKInspectorHighlightView setContentScaleFactor:](v73, "setContentScaleFactor:", v71 * a4);
  WebCore::FloatRect::operator CGRect();
  -[WKInspectorHighlightView setFrame:](v73, "setFrame:");
  v72 = *((unsigned __int8 *)a3 + 40);
  if ((v72 - 1) >= 2)
  {
    if (v72 == 3)
      -[WKInspectorHighlightView _layoutForRectsHighlight:](v73, "_layoutForRectsHighlight:", a3);
  }
  else
  {
    -[WKInspectorHighlightView _layoutForNodeListHighlight:](v73, "_layoutForNodeListHighlight:", a3);
  }
  -[WKInspectorHighlightView setNeedsDisplay](v73, "setNeedsDisplay");
}

- (void).cxx_destruct
{
  optional<WebCore::InspectorOverlayHighlight> *p_highlight;
  void *m_ptr;

  p_highlight = &self->_highlight;
  if (p_highlight->__engaged_)
    WebCore::InspectorOverlayHighlight::~InspectorOverlayHighlight((WebCore::InspectorOverlayHighlight *)p_highlight, (void *)a2);
  m_ptr = self->_layers.m_ptr;
  self->_layers.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_BYTE *)self + 424) = 0;
  *((_BYTE *)self + 528) = 0;
  return self;
}

@end
