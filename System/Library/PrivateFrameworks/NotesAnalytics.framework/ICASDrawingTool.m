@implementation ICASDrawingTool

- (ICASDrawingTool)initWithDrawingTool:(int64_t)a3
{
  ICASDrawingTool *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASDrawingTool;
  result = -[ICASDrawingTool init](&v5, sel_init);
  if (result)
    result->_drawingTool = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASDrawingTool drawingTool](self, "drawingTool", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("pencil");
  if (v3 == 2)
    return CFSTR("finger");
  else
    return (id)v4;
}

- (int64_t)drawingTool
{
  return self->_drawingTool;
}

@end
