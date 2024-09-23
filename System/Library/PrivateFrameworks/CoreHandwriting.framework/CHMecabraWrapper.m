@implementation CHMecabraWrapper

- (CHMecabraWrapper)init
{
  CHMecabraWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHMecabraWrapper;
  result = -[CHMecabraWrapper init](&v3, sel_init);
  if (result)
    result->_mecabra = 0;
  return result;
}

- (void)initMecabraIfNeededWithType:(int)a3 learningDictURL:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  if (a3 && !self->_mecabra)
  {
    v7 = v6;
    self->_mecabra = (__Mecabra *)MecabraCreateWithOptions();
    v6 = v7;
  }

}

- (void)dealloc
{
  objc_super v3;

  if (self->_mecabra)
    MecabraRelease();
  v3.receiver = self;
  v3.super_class = (Class)CHMecabraWrapper;
  -[CHMecabraWrapper dealloc](&v3, sel_dealloc);
}

- (__Mecabra)mecabra
{
  return self->_mecabra;
}

@end
