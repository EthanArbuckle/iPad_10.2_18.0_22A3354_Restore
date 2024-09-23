@implementation ASCAppOfferSavedState

- (ASCAppOfferSavedState)initWithState:(id)a3 metadata:(id)a4 flags:(int64_t)a5
{
  id v8;
  id v9;
  ASCAppOfferSavedState *v10;
  uint64_t v11;
  NSString *state;
  uint64_t v13;
  ASCOfferMetadata *metadata;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASCAppOfferSavedState;
  v10 = -[ASCAppOfferSavedState init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    state = v10->_state;
    v10->_state = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    metadata = v10->_metadata;
    v10->_metadata = (ASCOfferMetadata *)v13;

    v10->_flags = a5;
  }

  return v10;
}

- (BOOL)isLoadingFullState
{
  return -[ASCAppOfferSavedState flags](self, "flags") & 1;
}

- (BOOL)isActionable
{
  return ((unint64_t)-[ASCAppOfferSavedState flags](self, "flags") >> 1) & 1;
}

- (NSString)state
{
  return self->_state;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (int64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
