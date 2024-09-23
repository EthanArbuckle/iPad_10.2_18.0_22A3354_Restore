@implementation IDSQRParticipantStreams

+ (id)streamWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  IDSQRParticipantStreams *v11;
  const char *v12;
  double v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [IDSQRParticipantStreams alloc];
  v14 = (void *)objc_msgSend_initWithParticipantID_streamArray_anyParticipant_anyStream_(v11, v12, (uint64_t)v10, v13, v9, v7, v6);

  return v14;
}

- (IDSQRParticipantStreams)initWithParticipantID:(id)a3 streamArray:(id)a4 anyParticipant:(BOOL)a5 anyStream:(BOOL)a6
{
  id v11;
  id v12;
  IDSQRParticipantStreams *v13;
  IDSQRParticipantStreams *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IDSQRParticipantStreams;
  v13 = -[IDSQRParticipantStreams init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_participantID, a3);
    objc_storeStrong((id *)&v14->_streamArray, a4);
    v14->_anyParticipant = a5;
    v14->_anyStream = a6;
  }

  return v14;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@ (%1d,%1d) %@"), v2, self->_participantID, self->_anyParticipant, self->_anyStream, self->_streamArray);
}

- (NSNumber)participantID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)streamArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)anyParticipant
{
  return self->_anyParticipant;
}

- (BOOL)anyStream
{
  return self->_anyStream;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamArray, 0);
  objc_storeStrong((id *)&self->_participantID, 0);
}

@end
