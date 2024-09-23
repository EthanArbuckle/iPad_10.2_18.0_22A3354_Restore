@implementation PKLiveStrokesParticlesAnimation

- (PKLiveStrokesParticlesAnimation)initWithStrokes:(id)a3 startTime:(double)a4 duration:(double)a5 destinationFrame:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  PKLiveStrokesParticlesAnimation *v14;
  uint64_t v15;
  NSArray *strokes;
  objc_super v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKLiveStrokesParticlesAnimation;
  v14 = -[PKLiveStrokesParticlesAnimation init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v13, "copy");
    strokes = v14->_strokes;
    v14->_strokes = (NSArray *)v15;

    v14->_startTime = a4;
    v14->_duration = a5;
    v14->_destinationFrame.origin.x = x;
    v14->_destinationFrame.origin.y = y;
    v14->_destinationFrame.size.width = width;
    v14->_destinationFrame.size.height = height;
    -[PKLiveStrokesParticlesAnimation _calculateBounds](v14, "_calculateBounds");
  }

  return v14;
}

- (void)_calculateBounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v21 = *MEMORY[0x1E0C80C00];
  x = self->_destinationFrame.origin.x;
  y = self->_destinationFrame.origin.y;
  width = self->_destinationFrame.size.width;
  height = self->_destinationFrame.size.height;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_strokes;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "_bounds", (_QWORD)v16);
        v24.origin.x = v12;
        v24.origin.y = v13;
        v24.size.width = v14;
        v24.size.height = v15;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        v23 = CGRectUnion(v22, v24);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  self->_bounds.origin.x = x;
  self->_bounds.origin.y = y;
  self->_bounds.size.width = width;
  self->_bounds.size.height = height;
}

- (BOOL)isDoneAtTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[PKLiveStrokesParticlesAnimation startTime](self, "startTime");
  v6 = v5;
  -[PKLiveStrokesParticlesAnimation duration](self, "duration");
  return v6 + v7 <= a3;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (CGRect)destinationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_destinationFrame.origin.x;
  y = self->_destinationFrame.origin.y;
  width = self->_destinationFrame.size.width;
  height = self->_destinationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
