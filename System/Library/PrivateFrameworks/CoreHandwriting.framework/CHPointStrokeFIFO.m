@implementation CHPointStrokeFIFO

- (CHPointStrokeFIFO)initWithFIFO:(id)a3
{
  id v4;
  CHPointStrokeFIFO *v5;
  CHDrawing *v6;
  CHDrawing *drawing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHPointStrokeFIFO;
  v5 = -[CHPointFIFO initWithFIFO:](&v9, sel_initWithFIFO_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(CHDrawing);
    drawing = v5->_drawing;
    v5->_drawing = v6;

    objc_storeStrong((id *)&v5->_strokes, v5->_drawing);
  }

  return v5;
}

- (void)addPoint:(CHPointStrokeFIFO *)self
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float32x2_t v6;
  double v8;
  objc_super v9;

  v8 = *(double *)&v6;
  objc_msgSend_addPoint_(self->_drawing, a2, v2, v3, v4, v5, vcvtq_f64_f32(v6));
  v9.receiver = self;
  v9.super_class = (Class)CHPointStrokeFIFO;
  -[CHPointFIFO addPoint:](&v9, sel_addPoint_, v8);
}

- (void)flush
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  objc_msgSend_endStroke(self->_drawing, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CHPointStrokeFIFO;
  -[CHPointFIFO flush](&v7, sel_flush);
}

- (void)clear
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  objc_msgSend_clear(self->_drawing, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)CHPointStrokeFIFO;
  -[CHPointFIFO clear](&v7, sel_clear);
}

- (CHDrawing)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_strokes, a3);
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
