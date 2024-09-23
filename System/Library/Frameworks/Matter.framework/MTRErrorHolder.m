@implementation MTRErrorHolder

- (MTRErrorHolder)initWithError:(ChipError *)a3
{
  char *v4;
  MTRErrorHolder *v5;
  __int128 v6;
  char *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRErrorHolder;
  v4 = -[MTRErrorHolder init](&v9, sel_init);
  v5 = (MTRErrorHolder *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->mError;
    *((_QWORD *)v4 + 3) = *(_QWORD *)&a3->mLine;
    *(_OWORD *)(v4 + 8) = v6;
    v7 = v4;
  }

  return v5;
}

- (ChipError)error
{
  *retstr = *(ChipError *)&self->mFile;
  return self;
}

@end
