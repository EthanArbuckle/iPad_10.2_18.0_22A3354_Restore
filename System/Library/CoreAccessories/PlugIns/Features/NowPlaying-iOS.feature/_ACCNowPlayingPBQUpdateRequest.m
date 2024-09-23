@implementation _ACCNowPlayingPBQUpdateRequest

- (_ACCNowPlayingPBQUpdateRequest)initWithID:(id)a3 startIndex:(unsigned int)a4 upToCount:(unsigned int)a5 infoMask:(unsigned int)a6 allowNonLibrary:(BOOL)a7
{
  id v13;
  _ACCNowPlayingPBQUpdateRequest *v14;
  _ACCNowPlayingPBQUpdateRequest *v15;
  NSObject *v16;
  id v17;
  uint8_t v19[16];
  objc_super v20;

  v13 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_ACCNowPlayingPBQUpdateRequest;
  v14 = -[_ACCNowPlayingPBQUpdateRequest init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestID, a3);
    v15->_startIndex = a4;
    v15->_upToCount = a5;
    v15->_infoMask = a6;
    v15->_allowNonLibrary = a7;
    v15->_startTimeMs = 0;
    if (!a6)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[_ACCNowPlayingPBQUpdateRequest initWithID:startIndex:upToCount:infoMask:allowNonLibrary:].cold.1();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_21A237000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] no info requested, assume minimum PID info", v19, 2u);
      }

      v15->_infoMask = 1;
    }
  }

  return v15;
}

- (void)dealloc
{
  NSString *requestID;
  objc_super v4;

  requestID = self->_requestID;
  self->_requestID = 0;

  v4.receiver = self;
  v4.super_class = (Class)_ACCNowPlayingPBQUpdateRequest;
  -[_ACCNowPlayingPBQUpdateRequest dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<_ACCNowPlayingPBQUpdateRequest %@>[startIndex=%d upToCount=%d infoMask=0x%x allowNonLibrary=%d]"), self->_requestID, self->_startIndex, self->_upToCount, self->_infoMask, self->_allowNonLibrary);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unsigned int)a3
{
  self->_startIndex = a3;
}

- (unsigned)upToCount
{
  return self->_upToCount;
}

- (void)setUpToCount:(unsigned int)a3
{
  self->_upToCount = a3;
}

- (unsigned)infoMask
{
  return self->_infoMask;
}

- (void)setInfoMask:(unsigned int)a3
{
  self->_infoMask = a3;
}

- (BOOL)allowNonLibrary
{
  return self->_allowNonLibrary;
}

- (void)setAllowNonLibrary:(BOOL)a3
{
  self->_allowNonLibrary = a3;
}

- (unint64_t)startTimeMs
{
  return self->_startTimeMs;
}

- (void)setStartTimeMs:(unint64_t)a3
{
  self->_startTimeMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)initWithID:startIndex:upToCount:infoMask:allowNonLibrary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A237000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
