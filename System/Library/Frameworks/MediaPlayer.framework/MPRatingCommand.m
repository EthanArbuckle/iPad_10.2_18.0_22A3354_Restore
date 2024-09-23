@implementation MPRatingCommand

- (id)_mediaRemoteCommandInfoOptions
{
  double v2;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D4C7C8];
  *(float *)&v2 = self->_minimumRating;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E0D4C7C0];
  *(float *)&v5 = self->_maximumRating;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setMinimumRating:(float)minimumRating
{
  if (vabds_f32(self->_minimumRating, minimumRating) > 0.00000011921)
  {
    self->_minimumRating = minimumRating;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setMaximumRating:(float)maximumRating
{
  if (vabds_f32(self->_maximumRating, maximumRating) > 0.00000011921)
  {
    self->_maximumRating = maximumRating;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (id)newCommandEventWithRating:(float)a3
{
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v11 = *MEMORY[0x1E0D4CCB0];
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v8);

  return v9;
}

- (float)minimumRating
{
  return self->_minimumRating;
}

- (float)maximumRating
{
  return self->_maximumRating;
}

@end
