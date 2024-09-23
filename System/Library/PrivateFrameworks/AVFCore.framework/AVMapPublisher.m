@implementation AVMapPublisher

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMapPublisher;
  -[AVPublisher dealloc](&v3, sel_dealloc);
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  AVPublisher *upstream;
  _QWORD v6[6];

  upstream = self->_upstream;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__AVMapPublisher_subscribeRequestingInitialValue_block___block_invoke;
  v6[3] = &unk_1E3032370;
  v6[4] = self;
  v6[5] = a4;
  return -[AVPublisher subscribeRequestingInitialValue:block:](upstream, "subscribeRequestingInitialValue:block:", a3, v6);
}

uint64_t __56__AVMapPublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

+ (id)mapPublisherWithUpstream:(id)a3 transform:(id)a4
{
  return -[AVMapPublisher initWithUpstream:transform:]([AVMapPublisher alloc], "initWithUpstream:transform:", a3, a4);
}

- (AVMapPublisher)initWithUpstream:(id)a3 transform:(id)a4
{
  AVMapPublisher *v6;
  AVMapPublisher *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMapPublisher;
  v6 = -[AVPublisher init](&v9, sel_init);
  v7 = v6;
  if (a4)
  {
    if (v6)
    {
      v6->_upstream = (AVPublisher *)a3;
      v7->_transform = (id)objc_msgSend(a4, "copy");
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p upstream=%@>"), objc_opt_class(), self, self->_upstream);
}

@end
