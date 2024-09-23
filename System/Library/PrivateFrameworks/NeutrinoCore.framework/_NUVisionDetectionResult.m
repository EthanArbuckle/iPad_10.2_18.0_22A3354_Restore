@implementation _NUVisionDetectionResult

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[_NUVisionDetectionResult imageSize](self, "imageSize");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVisionDetectionResult observations](self, "observations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; imageSize = %@, observationCount = %lu>"),
    v4,
    self,
    v7,
    objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSArray)observations
{
  return self->observations;
}

- (void)setObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)imageSize
{
  int64_t v2;
  int64_t v3;
  _QWORD v4[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  objc_copyStruct(v4, &self->imageSize, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setImageSize:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = a3;
  objc_copyStruct(&self->imageSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->observations, 0);
}

@end
