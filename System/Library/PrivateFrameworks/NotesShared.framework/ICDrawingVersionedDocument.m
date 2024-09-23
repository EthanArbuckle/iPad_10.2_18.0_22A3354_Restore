@implementation ICDrawingVersionedDocument

+ (unsigned)serializationVersion
{
  return 4;
}

+ (unsigned)minimumSupportedVersion
{
  return 1;
}

- (ICDrawing)drawing
{
  ICDrawing *drawing;
  ICDrawing *v4;
  void *v5;
  ICDrawing *v6;
  ICDrawing *v7;
  ICDrawing *v8;

  drawing = self->_drawing;
  if (drawing)
  {
    v4 = drawing;
    v5 = self->_drawing;
    self->_drawing = v4;
  }
  else
  {
    v6 = [ICDrawing alloc];
    -[ICTTVersionedDocument replicaID](self, "replicaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICDrawing initWithReplicaID:](v6, "initWithReplicaID:", v5);
    v8 = self->_drawing;
    self->_drawing = v7;

  }
  return self->_drawing;
}

- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  -[ICDrawingVersionedDocument drawing](self, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "drawing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mergeWithDrawing:", v6);

  v9.receiver = self;
  v9.super_class = (Class)ICDrawingVersionedDocument;
  -[ICTTVersionedDocument mergeWithVersionedDocument:](&v9, sel_mergeWithVersionedDocument_, v4);

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v4;
  ICDrawing *v6;
  void *v7;
  ICDrawing *v8;
  void *drawing;
  ICDrawing *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  v6 = [ICDrawing alloc];
  -[ICTTVersionedDocument replicaID](self, "replicaID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICDrawing initWithData:version:replicaID:](v6, "initWithData:version:replicaID:", v11, v4, v7);

  if (!self->_drawing)
  {
    v10 = v8;
    drawing = self->_drawing;
    self->_drawing = v10;
    goto LABEL_5;
  }
  if (v8)
  {
    -[ICDrawingVersionedDocument drawing](self, "drawing");
    drawing = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(drawing, "mergeWithDrawing:", v8);
LABEL_5:

  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  void *v4;
  void *v5;

  -[ICDrawingVersionedDocument drawing](self, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializeWithPathData:toVersion:", 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
