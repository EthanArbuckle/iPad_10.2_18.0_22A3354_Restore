@implementation MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue

- (id)_initWithUnderlyingMutableQueue:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue *v6;
  MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue;
  v6 = -[MusicKit_SoftLinking_MPMusicPlayerControllerMutableQueue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingMutableQueue, a3);

  return v7;
}

- (MPMusicPlayerControllerMutableQueue)_underlyingMutableQueue
{
  return self->_underlyingMutableQueue;
}

- (void)insertQueueDescriptor:(id)a3 afterItemWithIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "_underlyingQueueDescriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[MPMusicPlayerControllerMutableQueue _insertQueueDescriptor:afterItemWithIdentifier:](self->_underlyingMutableQueue, "_insertQueueDescriptor:afterItemWithIdentifier:", v7, v6);

}

- (void)removeItemWithIdentifier:(id)a3
{
  -[MPMusicPlayerControllerMutableQueue _removeItemWithIdentifier:](self->_underlyingMutableQueue, "_removeItemWithIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMutableQueue, 0);
}

@end
