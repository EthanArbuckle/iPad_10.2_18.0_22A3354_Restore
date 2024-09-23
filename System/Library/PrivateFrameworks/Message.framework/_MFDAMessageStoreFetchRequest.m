@implementation _MFDAMessageStoreFetchRequest

- (unint64_t)generationNumber
{
  unint64_t v4;
  void *v6;

  v4 = -[MFMessage generationNumber](self->message, "generationNumber");
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFDAMessageStore.m"), 1281, CFSTR("fetchable messages should have non-zero generationNumer"));

  }
  return v4;
}

- (BOOL)shouldSend
{
  MFMimePart *part;
  uint64_t v4;
  MFMessage *message;
  void *v6;
  uint64_t v7;
  MFDAMessagePayloadFetchResponseImpl *v8;

  part = self->part;
  if (part)
  {
    -[MFLibraryStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:](self->store, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", part, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = (void *)v4;
    goto LABEL_6;
  }
  message = self->message;
  if (message)
  {
    -[MFLibraryStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:](self->store, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", message, 0, 0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    v8 = -[MFDAMessagePayloadFetchResponseImpl initWithData:streaming:streamingDone:]([MFDAMessagePayloadFetchResponseImpl alloc], "initWithData:streaming:streamingDone:", v6, 0, 0);
    -[MFRequestQueueResponseConsumer handleResponse:error:](self->consumer, "handleResponse:error:", v8, 0);

  }
  return v7 == 0;
}

- (BOOL)isUserRequested
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MFMessage remoteID](self->message, "remoteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMessage remoteID](self->message, "remoteID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[6], "remoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->part, 0);
  objc_storeStrong((id *)&self->message, 0);
  objc_storeStrong((id *)&self->store, 0);
  objc_storeStrong((id *)&self->consumer, 0);
}

@end
