@implementation ICASDrawingActionType

- (ICASDrawingActionType)initWithDrawingActionType:(int64_t)a3
{
  ICASDrawingActionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASDrawingActionType;
  result = -[ICASDrawingActionType init](&v5, sel_init);
  if (result)
    result->_drawingActionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASDrawingActionType drawingActionType](self, "drawingActionType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return *(&off_1E771C5A0 + v3 - 1);
}

- (int64_t)drawingActionType
{
  return self->_drawingActionType;
}

@end
