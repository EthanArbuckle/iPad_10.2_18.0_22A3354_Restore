@implementation MADPersonalizedEmbeddingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonalizedEmbeddingRequest)init
{
  MADPersonalizedEmbeddingRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MADPersonalizedEmbeddingRequest;
  result = -[MADPersonalizedEmbeddingRequest init](&v3, sel_init);
  if (result)
  {
    result->_revision = 1;
    result->_bypassFaceDetection = 0;
  }
  return result;
}

- (MADPersonalizedEmbeddingRequest)initWithCoder:(id)a3
{
  id v4;
  MADPersonalizedEmbeddingRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADPersonalizedEmbeddingRequest;
  v5 = -[MADMultiModalRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_revision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Revision"));
    v5->_bypassFaceDetection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BypassFaceDetection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADPersonalizedEmbeddingRequest;
  v4 = a3;
  -[MADMultiModalRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_revision, CFSTR("Revision"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_bypassFaceDetection, CFSTR("BypassFaceDetection"));

}

- (void)setType:(int64_t)a3
{
  int v3;
  uint64_t v4;

  if (a3 == 2)
  {
    v4 = 3;
    goto LABEL_5;
  }
  v3 = a3;
  if (a3 == 1)
  {
    v4 = 1;
LABEL_5:
    -[MADPersonalizedEmbeddingRequest setRevision:](self, "setRevision:", v4);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MADPersonalizedEmbeddingRequest setType:].cold.1(v3);
}

- (int64_t)type
{
  int64_t revision;

  revision = self->_revision;
  if (revision == 1)
    return 1;
  else
    return 2 * (revision == 3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("revision: %d, "), self->_revision);
  objc_msgSend(v3, "appendFormat:", CFSTR("bypassFaceDetection: %d, "), self->_bypassFaceDetection);
  -[MADMultiModalRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADMultiModalRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (BOOL)bypassFaceDetection
{
  return self->_bypassFaceDetection;
}

- (void)setBypassFaceDetection:(BOOL)a3
{
  self->_bypassFaceDetection = a3;
}

- (void)setType:(int)a1 .cold.1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set unsupported personalization type (%d)", (uint8_t *)v1, 8u);
}

@end
