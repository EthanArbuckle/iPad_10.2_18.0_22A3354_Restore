@implementation PKIntersectionResult

+ (id)noResult
{
  if (_MergedGlobals_159 != -1)
    dispatch_once(&_MergedGlobals_159, &__block_literal_global_89);
  return (id)qword_1ECEE65E8;
}

uint64_t __32__PKIntersectionResult_noResult__block_invoke()
{
  PKIntersectionResult *v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(PKIntersectionResult);
  v1 = (void *)qword_1ECEE65E8;
  qword_1ECEE65E8 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECEE65E8, "setIntersectedStrokes:", v2);

  objc_msgSend((id)qword_1ECEE65E8, "setIntersectionAlgorithmType:", 0);
  return objc_msgSend((id)qword_1ECEE65E8, "setContentType:", 0);
}

- (NSOrderedSet)intersectedStrokes
{
  return self->_intersectedStrokes;
}

- (void)setIntersectedStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_intersectedStrokes, a3);
}

- (int64_t)intersectionAlgorithmType
{
  return self->_intersectionAlgorithmType;
}

- (void)setIntersectionAlgorithmType:(int64_t)a3
{
  self->_intersectionAlgorithmType = a3;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intersectedStrokes, 0);
}

@end
