@implementation _ACCNowPlayingPBQUpdateRequestAccessory

- (_ACCNowPlayingPBQUpdateRequestAccessory)initWithAccessoryUID:(id)a3
{
  id v5;
  _ACCNowPlayingPBQUpdateRequestAccessory *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSString *currentRequestID;
  _ACCNowPlayingPBQUpdateRequest *currentRequest;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ACCNowPlayingPBQUpdateRequestAccessory;
  v6 = -[_ACCNowPlayingPBQUpdateRequestAccessory init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.accessory.nowplaying.pbqupdate", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    currentRequestID = v6->_currentRequestID;
    v6->_currentRequestID = 0;

    currentRequest = v6->_currentRequest;
    v6->_currentRequest = 0;

  }
  return v6;
}

- (void)dealloc
{
  NSString *accessoryUID;
  OS_dispatch_queue *queue;
  NSString *currentRequestID;
  _ACCNowPlayingPBQUpdateRequest *currentRequest;
  objc_super v7;

  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  queue = self->_queue;
  self->_queue = 0;

  currentRequestID = self->_currentRequestID;
  self->_currentRequestID = 0;

  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  v7.receiver = self;
  v7.super_class = (Class)_ACCNowPlayingPBQUpdateRequestAccessory;
  -[_ACCNowPlayingPBQUpdateRequestAccessory dealloc](&v7, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ACCNowPlayingPBQUpdateRequestAccessory %@>[currentRequest:ID=%@ request=(%@)]"), self->_accessoryUID, self->_currentRequestID, self->_currentRequest);
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)currentRequestID
{
  return self->_currentRequestID;
}

- (void)setCurrentRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestID, a3);
}

- (_ACCNowPlayingPBQUpdateRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end
