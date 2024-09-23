@implementation _CHSIntentReferenceBufBuilder

- (_QWORD)initWithBufferBuilder:(_QWORD *)a1
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_CHSIntentReferenceBufBuilder;
    v5 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      objc_msgSend(v4, "firstError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = operator new();
        v8 = objc_msgSend(v4, "fbb");
        *(_QWORD *)v7 = v8;
        apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(v8);
        *(_BYTE *)(v8 + 70) = 1;
        *(_DWORD *)(v7 + 8) = *(_DWORD *)(v8 + 32) - *(_DWORD *)(v8 + 48) + *(_DWORD *)(v8 + 40);
        a1[2] = v7;
      }
    }
  }

  return a1;
}

- (void)dealloc
{
  IntentReferenceBufBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x194008D84](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)_CHSIntentReferenceBufBuilder;
  -[_CHSIntentReferenceBufBuilder dealloc](&v4, sel_dealloc);
}

- (void)setStableHash:(int64_t)a3
{
  void *v5;

  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<long long>((unint64_t)self->_bldr->var0, 4, a3, 0);
}

- (void)setIntentData:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setSchemaData:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setPartialIntentData:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2422, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 10, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
