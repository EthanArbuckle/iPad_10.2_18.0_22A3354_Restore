@implementation _CHSWidgetRelevanceBufBuilder

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
    v10.super_class = (Class)_CHSWidgetRelevanceBufBuilder;
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
  WidgetRelevanceBufBuilder *bldr;
  objc_super v4;

  bldr = self->_bldr;
  if (bldr)
    MEMORY[0x194008D84](bldr, 0x1020C403A5D3213);
  v4.receiver = self;
  v4.super_class = (Class)_CHSWidgetRelevanceBufBuilder;
  -[_CHSWidgetRelevanceBufBuilder dealloc](&v4, sel_dealloc);
}

- (void)setAttributeKey:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1890, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void)setIntentReference:(id)a3
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1900, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

  }
  -[AFBBufferBuilder firstError](self->_owner, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::Vector<unsigned char>>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, objc_msgSend(v7, "unsignedIntValue"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
}

@end
