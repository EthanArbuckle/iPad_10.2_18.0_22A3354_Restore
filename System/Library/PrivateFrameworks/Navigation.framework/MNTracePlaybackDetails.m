@implementation MNTracePlaybackDetails

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTracePlaybackDetails)initWithCoder:(id)a3
{
  id v4;
  MNTracePlaybackDetails *v5;
  uint64_t v6;
  NSString *tracePath;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *bookmarks;
  uint64_t v15;
  NSString *pedestrianTracePath;
  double v17;
  MNTracePlaybackDetails *v18;

  v4 = a3;
  v5 = -[MNTracePlaybackDetails init](self, "init");
  if (v5)
  {
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tracePath"));
    v6 = objc_claimAutoreleasedReturnValue();
    tracePath = v5->_tracePath;
    v5->_tracePath = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_traceDuration"));
    v5->_traceDuration = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_currentPosition"));
    v5->_currentPosition = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_bookmarks"));
    v13 = objc_claimAutoreleasedReturnValue();
    bookmarks = v5->_bookmarks;
    v5->_bookmarks = (NSArray *)v13;

    v5->_recordedBookmarkID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_recordedBookmarkID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pedestrianTracePath"));
    v15 = objc_claimAutoreleasedReturnValue();
    pedestrianTracePath = v5->_pedestrianTracePath;
    v5->_pedestrianTracePath = (NSString *)v15;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_pedestrianTraceStartRelativeTimestamp"));
    v5->_pedestrianTraceStartRelativeTimestamp = v17;
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t eventType;
  id v5;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", eventType, CFSTR("_eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tracePath, CFSTR("_tracePath"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_traceDuration"), self->_traceDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_currentPosition"), self->_currentPosition);
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmarks, CFSTR("_bookmarks"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_recordedBookmarkID, CFSTR("_recordedBookmarkID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pedestrianTracePath, CFSTR("_pedestrianTracePath"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_pedestrianTraceStartRelativeTimestamp"), self->_pedestrianTraceStartRelativeTimestamp);

}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSString)tracePath
{
  return self->_tracePath;
}

- (void)setTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)traceDuration
{
  return self->_traceDuration;
}

- (void)setTraceDuration:(double)a3
{
  self->_traceDuration = a3;
}

- (double)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(double)a3
{
  self->_currentPosition = a3;
}

- (NSArray)bookmarks
{
  return self->_bookmarks;
}

- (void)setBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarks, a3);
}

- (unint64_t)recordedBookmarkID
{
  return self->_recordedBookmarkID;
}

- (void)setRecordedBookmarkID:(unint64_t)a3
{
  self->_recordedBookmarkID = a3;
}

- (NSString)pedestrianTracePath
{
  return self->_pedestrianTracePath;
}

- (void)setPedestrianTracePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)pedestrianTraceStartRelativeTimestamp
{
  return self->_pedestrianTraceStartRelativeTimestamp;
}

- (void)setPedestrianTraceStartRelativeTimestamp:(double)a3
{
  self->_pedestrianTraceStartRelativeTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pedestrianTracePath, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_tracePath, 0);
}

@end
