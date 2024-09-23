@implementation StateData

- (StateData)init
{
  StateData *v2;
  StateData *v3;
  uint64_t v4;
  NSMutableArray *joinMethods;
  uint64_t v6;
  NSMutableArray *conferenceDetails;
  uint64_t v8;
  NSMutableArray *ranges;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)StateData;
  v2 = -[StateData init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    joinMethods = v3->_joinMethods;
    v3->_joinMethods = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    conferenceDetails = v3->_conferenceDetails;
    v3->_conferenceDetails = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    ranges = v3->_ranges;
    v3->_ranges = (NSMutableArray *)v8;

  }
  return v3;
}

- (void)resetToNewSection
{
  -[NSMutableArray removeAllObjects](self->_joinMethods, "removeAllObjects");
  self->_state = 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSRange v17;
  NSRange v18;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = -[StateData state](self, "state");
  -[StateData blockTitle](self, "blockTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData conferenceTitle](self, "conferenceTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData joinMethodTitle](self, "joinMethodTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData joinMethodURL](self, "joinMethodURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17.location = -[StateData startRange](self, "startRange");
  NSStringFromRange(v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18.location = -[StateData endRange](self, "endRange");
  NSStringFromRange(v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData joinMethods](self, "joinMethods");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData conferenceDetails](self, "conferenceDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[StateData ranges](self, "ranges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[StateData joinMethodIsBroadcast](self, "joinMethodIsBroadcast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("ParseData state: %tu, blockTitle: %@, conferenceTitle: %@, joinMethodTitle: %@, joinMethodURL: %@, startRange: %@, endRange: %@, joinMethods: %@, conferenceDetails: %@, ranges: %@, joinMethodIsBroadcast: %@"), v15, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)blockTitle
{
  return self->_blockTitle;
}

- (void)setBlockTitle:(id)a3
{
  objc_storeStrong((id *)&self->_blockTitle, a3);
}

- (NSString)conferenceTitle
{
  return self->_conferenceTitle;
}

- (void)setConferenceTitle:(id)a3
{
  objc_storeStrong((id *)&self->_conferenceTitle, a3);
}

- (NSString)joinMethodTitle
{
  return self->_joinMethodTitle;
}

- (void)setJoinMethodTitle:(id)a3
{
  objc_storeStrong((id *)&self->_joinMethodTitle, a3);
}

- (NSURL)joinMethodURL
{
  return self->_joinMethodURL;
}

- (void)setJoinMethodURL:(id)a3
{
  objc_storeStrong((id *)&self->_joinMethodURL, a3);
}

- (BOOL)joinMethodIsBroadcast
{
  return self->_joinMethodIsBroadcast;
}

- (void)setJoinMethodIsBroadcast:(BOOL)a3
{
  self->_joinMethodIsBroadcast = a3;
}

- (_NSRange)startRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_startRange.length;
  location = self->_startRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  self->_startRange = a3;
}

- (_NSRange)endRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_endRange.length;
  location = self->_endRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEndRange:(_NSRange)a3
{
  self->_endRange = a3;
}

- (NSMutableArray)joinMethods
{
  return self->_joinMethods;
}

- (void)setJoinMethods:(id)a3
{
  objc_storeStrong((id *)&self->_joinMethods, a3);
}

- (NSMutableArray)conferenceDetails
{
  return self->_conferenceDetails;
}

- (void)setConferenceDetails:(id)a3
{
  objc_storeStrong((id *)&self->_conferenceDetails, a3);
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
  objc_storeStrong((id *)&self->_ranges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_conferenceDetails, 0);
  objc_storeStrong((id *)&self->_joinMethods, 0);
  objc_storeStrong((id *)&self->_joinMethodURL, 0);
  objc_storeStrong((id *)&self->_joinMethodTitle, 0);
  objc_storeStrong((id *)&self->_conferenceTitle, 0);
  objc_storeStrong((id *)&self->_blockTitle, 0);
}

@end
