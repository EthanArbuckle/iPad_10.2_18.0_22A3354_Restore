@implementation MSVLyricsElement

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  +[MSVLyricsElement _descriptionForElementType:](MSVLyricsElement, "_descriptionForElementType:", -[MSVLyricsElement type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsElement startTime](self, "startTime");
  v7 = v6;
  -[MSVLyricsElement endTime](self, "endTime");
  v9 = v8;
  -[MSVLyricsElement agent](self, "agent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)MSVLyricsElement;
  -[MSVLyricsXMLElement description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> Type: %@, start: %g, end:%g, agent: %@, XML element: %@"), v4, self, v5, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (MSVLyricsAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_storeStrong((id *)&self->_role, a3);
}

- (BOOL)isBackgroundVocal
{
  return self->_isBackgroundVocal;
}

- (void)setIsBackgroundVocal:(BOOL)a3
{
  self->_isBackgroundVocal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

+ (id)_descriptionForElementType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return off_1E43E8830[a3];
}

@end
