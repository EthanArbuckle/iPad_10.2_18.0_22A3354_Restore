@implementation QLMovieEdits

- (QLMovieEdits)init
{
  QLMovieEdits *v2;
  QLMovieEdits *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLMovieEdits;
  v2 = -[QLMovieEdits init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[QLMovieEdits resetEditingValues](v2, "resetEditingValues");
  return v3;
}

+ (id)editsWithRightRotationsCount:(unint64_t)a3 trimStartTime:(double)a4 trimEndTime:(double)a5
{
  void *v8;

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setRightRotationsCount:", a3);
  objc_msgSend(v8, "setTrimStartTime:", a4);
  objc_msgSend(v8, "setTrimEndTime:", a5);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  QLMovieEdits *v4;
  QLMovieEdits *v5;
  unint64_t rightRotationsCount;
  double trimStartTime;
  double v8;
  double trimEndTime;
  double v10;
  BOOL v11;

  v4 = (QLMovieEdits *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      rightRotationsCount = self->_rightRotationsCount;
      if (rightRotationsCount == -[QLMovieEdits rightRotationsCount](v5, "rightRotationsCount")
        && (trimStartTime = self->_trimStartTime, -[QLMovieEdits trimStartTime](v5, "trimStartTime"),
                                                  trimStartTime == v8))
      {
        trimEndTime = self->_trimEndTime;
        -[QLMovieEdits trimEndTime](v5, "trimEndTime");
        v11 = trimEndTime == v10;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)incrementRightRotationsCount
{
  self->_rightRotationsCount = (LODWORD(self->_rightRotationsCount) + 1) & 3;
}

- (void)resetTrimmingValues
{
  *(int64x2_t *)&self->_trimStartTime = vdupq_n_s64(0x7FF8000000000000uLL);
}

- (void)resetEditingValues
{
  self->_rightRotationsCount = 0;
  -[QLMovieEdits resetTrimmingValues](self, "resetTrimmingValues");
}

- (BOOL)hasEdits
{
  return -[QLMovieEdits rotated](self, "rotated") || -[QLMovieEdits trimmed](self, "trimmed");
}

- (BOOL)rotated
{
  return self->_rightRotationsCount != 0;
}

- (BOOL)trimmed
{
  return 1;
}

- (unint64_t)rightRotationsCount
{
  return self->_rightRotationsCount;
}

- (void)setRightRotationsCount:(unint64_t)a3
{
  self->_rightRotationsCount = a3;
}

- (double)trimStartTime
{
  return self->_trimStartTime;
}

- (void)setTrimStartTime:(double)a3
{
  self->_trimStartTime = a3;
}

- (double)trimEndTime
{
  return self->_trimEndTime;
}

- (void)setTrimEndTime:(double)a3
{
  self->_trimEndTime = a3;
}

@end
