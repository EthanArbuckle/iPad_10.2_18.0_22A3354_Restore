@implementation _BMDKEventCodec_DKPREvent

- (id)encodeAsProto:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "dkEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "toPBCodableUseStructuredMetadata:", 1);
  else
    objc_msgSend(v3, "toPBCodable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)decodeWithProto:(id)a3
{
  id v4;
  char v5;
  id DKEventClass_1;
  NSObject *v7;
  BMDKEvent *v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  get_DKPREventClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[_BMDKEventCodec_DKPREvent decodeWithProto:].cold.1(v7);

    goto LABEL_8;
  }
  get_DKEventClass_1();
  v5 = objc_opt_respondsToSelector();
  DKEventClass_1 = get_DKEventClass_1();
  if ((v5 & 1) != 0)
    objc_msgSend(DKEventClass_1, "fromPBCodable:skipMetadata:", v4, -[BMDKEventCodec decodeMetadata](self, "decodeMetadata") ^ 1);
  else
    objc_msgSend(DKEventClass_1, "fromPBCodable:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[BMDKEvent initWithDKEvent:]([BMDKEvent alloc], "initWithDKEvent:", v9);

LABEL_11:
  return v8;
}

- (id)decodeWithProtoData:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)get_DKPREventClass()), "initWithData:", v4);

    -[_BMDKEventCodec_DKPREvent decodeWithProto:](self, "decodeWithProto:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)decodeWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18D810000, log, OS_LOG_TYPE_FAULT, "BMDKEvent: tried to initialize with a non-_DKPREvent proto", v1, 2u);
}

@end
