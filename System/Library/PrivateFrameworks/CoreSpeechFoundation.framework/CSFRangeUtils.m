@implementation CSFRangeUtils

- (CSFRangeUtils)initWithStartPoint:(unint64_t)a3 endPoint:(unint64_t)a4
{
  CSFRangeUtils *v6;
  NSObject *v7;
  CSFRangeUtils *v8;
  CSFRangeUtils *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v6 = self;
  v18 = *MEMORY[0x1E0C80C00];
  if (a4 >= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)CSFRangeUtils;
    v9 = -[CSFRangeUtils init](&v11, sel_init);
    if (v9)
    {
      v9->_startPoint = a3;
      v9->_endPoint = a4;
    }
    v6 = v9;
    v8 = v6;
  }
  else
  {
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[CSFRangeUtils initWithStartPoint:endPoint:]";
      v14 = 2050;
      v15 = a3;
      v16 = 2050;
      v17 = a4;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Invalid input : startPoint = %{public}llu, endPoint = %{public}llu", buf, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasIntersectionWithRange:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t startPoint;
  BOOL v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSFRangeUtils hasIntersectionWithRange:]";
      _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Invalid input range", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_11;
  }
  v6 = objc_msgSend(v4, "startPoint");
  v7 = objc_msgSend(v5, "endPoint");
  startPoint = self->_startPoint;
  if ((v7 < startPoint || v7 >= self->_endPoint)
    && (v6 < startPoint || v6 >= self->_endPoint)
    && (v6 > startPoint || v7 < self->_endPoint))
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v9 = 1;
LABEL_12:

  return v9;
}

- (unint64_t)startPoint
{
  return self->_startPoint;
}

- (unint64_t)endPoint
{
  return self->_endPoint;
}

@end
