@implementation APLatencyVisualizationLayer

- (id)init:(void *)a3 timeContext:(void *)a4 zPosition:(int)a5
{
  if (-[APLatencyVisualizationLayer init](self, "init"))
  {
    -[APLatencyVisualizationLayer setZPosition:](self, "setZPosition:", (double)a5);
    -[APLatencyVisualizationLayer setName:](self, "setName:", CFSTR("Latency Tracking Layer"));
    self->_getAbsoluteTime = a3;
    self->_timeContext = a4;
    self->_dotOffset = 32.0;
    self->_dotDiameter = 10.0;
    self->_dotSpeed = 500.0;
    self->_dotSpeedX = 433.012702;
    self->_dotSpeedY = self->_dotSpeed * 0.5;
  }
  return self;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5;
  double dotOffset;
  double v7;
  double v8;
  double dotDiameter;
  double v10;
  double v11;
  double dotSpeedX;
  double v13;
  int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double dotSpeedY;
  double v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  CGFloat v27;
  CGRect v28;
  CGRect v29;

  v5 = ((double (*)(void *, SEL))self->_getAbsoluteTime)(self->_timeContext, a2);
  dotOffset = self->_dotOffset;
  -[APLatencyVisualizationLayer contentsScale](self, "contentsScale");
  v8 = dotOffset * v7;
  dotDiameter = self->_dotDiameter;
  -[APLatencyVisualizationLayer contentsScale](self, "contentsScale");
  v11 = dotDiameter * v10;
  dotSpeedX = self->_dotSpeedX;
  -[APLatencyVisualizationLayer frame](self, "frame");
  v14 = (int)(v13 - (v8 + v8));
  v15 = 2 * v14;
  v16 = (unint64_t)(v5 * dotSpeedX) % v15;
  v17 = v15 - v16;
  if (v16 <= v14)
    v18 = v16;
  else
    v18 = v17;
  v19 = v8 + (double)v18;
  dotSpeedY = self->_dotSpeedY;
  -[APLatencyVisualizationLayer frame](self, "frame");
  v22 = (int)(v21 - (v8 + v8));
  v23 = 2 * v22;
  v24 = (unint64_t)(v5 * dotSpeedY) % v23;
  v25 = v23 - v24;
  if (v24 <= v22)
    v26 = v24;
  else
    v26 = v25;
  v27 = v8 + (double)v26;
  CGContextSetLineWidth(a3, 2.0);
  CGContextSetRGBStrokeColor(a3, 1.0, 0.0, 0.0, 1.0);
  CGContextSetRGBFillColor(a3, 1.0, 0.0, 0.0, 1.0);
  v28.origin.x = v19;
  v28.origin.y = v27;
  v28.size.width = v11;
  v28.size.height = v11;
  CGContextStrokeEllipseInRect(a3, v28);
  v29.origin.x = v19;
  v29.origin.y = v27;
  v29.size.width = v11;
  v29.size.height = v11;
  CGContextFillEllipseInRect(a3, v29);
}

@end
