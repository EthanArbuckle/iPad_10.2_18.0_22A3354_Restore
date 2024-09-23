@implementation WKVelocityTrackingScrollView

- (void)updateInteractiveScrollVelocity
{
  ScrollingDeltaWindow<3UL> *p_scrollingDeltaWindow;
  WTF::ApproximateTime *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _OWORD *v12;
  char *v13;
  unint64_t m_lastIndex;
  double v15;
  double *p_width;
  unint64_t v17;

  if ((-[WKVelocityTrackingScrollView isTracking](self, "isTracking") & 1) != 0
    || -[WKVelocityTrackingScrollView isDecelerating](self, "isDecelerating"))
  {
    p_scrollingDeltaWindow = &self->_scrollingDeltaWindow;
    v4 = (WTF::ApproximateTime *)-[WKVelocityTrackingScrollView contentOffset](self, "contentOffset");
    v6 = v5;
    v8 = v7;
    WTF::ApproximateTime::now(v4);
    v10 = v9 - self->_scrollingDeltaWindow.m_lastTimestamp.m_value;
    if (v10 <= 0.1)
    {
      m_lastIndex = self->_scrollingDeltaWindow.m_lastIndex;
      if (m_lastIndex >= 3)
      {
        __break(1u);
        return;
      }
      v15 = v8 - self->_scrollingDeltaWindow.m_lastOffset.y;
      p_width = &p_scrollingDeltaWindow->m_deltas.__elems_[m_lastIndex].first.width;
      *p_width = v6 - self->_scrollingDeltaWindow.m_lastOffset.x;
      p_width[1] = v15;
      p_width[2] = v10;
      if (m_lastIndex == 2)
        v17 = 0;
      else
        v17 = m_lastIndex + 1;
      self->_scrollingDeltaWindow.m_lastIndex = v17;
    }
    else
    {
      v11 = 0;
      v12 = (_OWORD *)MEMORY[0x1E0C9D820];
      do
      {
        v13 = (char *)p_scrollingDeltaWindow + v11;
        *(_OWORD *)v13 = *v12;
        *((_QWORD *)v13 + 2) = 0;
        v11 += 24;
      }
      while (v11 != 72);
    }
    self->_scrollingDeltaWindow.m_lastTimestamp.m_value = v9;
    self->_scrollingDeltaWindow.m_lastOffset.x = v6;
    self->_scrollingDeltaWindow.m_lastOffset.y = v8;
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 132) = 0u;
  *((_OWORD *)self + 133) = 0u;
  *((_OWORD *)self + 134) = 0u;
  *((_OWORD *)self + 135) = 0u;
  *((_OWORD *)self + 136) = 0u;
  *((_QWORD *)self + 274) = 0;
  *(_OWORD *)((char *)self + 2200) = *MEMORY[0x1E0C9D538];
  return self;
}

- (CGSize)interactiveScrollVelocityInPointsPerSecond
{
  ScrollingDeltaWindow<3UL> *p_scrollingDeltaWindow;
  double v3;
  double v4;
  float64x2_t v5;
  uint64_t v6;
  double v7;
  float64x2_t v8;
  uint64_t v9;
  double v10;
  CGSize result;

  p_scrollingDeltaWindow = &self->_scrollingDeltaWindow;
  WTF::ApproximateTime::now((WTF::ApproximateTime *)self);
  v4 = v3 - p_scrollingDeltaWindow->m_lastTimestamp.m_value;
  v5 = *(float64x2_t *)MEMORY[0x1E0C9D820];
  if (v4 <= 0.1)
  {
    v6 = 0;
    v7 = 0.0;
    v8 = *(float64x2_t *)MEMORY[0x1E0C9D820];
    do
    {
      v9 = *(uint64_t *)&p_scrollingDeltaWindow->m_deltas.__elems_[v6].second.m_value;
      if (*(double *)&v9 != 0.0)
      {
        v8 = vaddq_f64(v8, vdivq_f64((float64x2_t)p_scrollingDeltaWindow->m_deltas.__elems_[v6].first, (float64x2_t)vdupq_lane_s64(v9, 0)));
        v7 = v7 + 1.0;
      }
      ++v6;
    }
    while (v6 != 3);
    if (v7 != 0.0)
      v5 = vdivq_f64(v8, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v7, 0));
  }
  v10 = v5.f64[1];
  result.width = v5.f64[0];
  result.height = v10;
  return result;
}

@end
