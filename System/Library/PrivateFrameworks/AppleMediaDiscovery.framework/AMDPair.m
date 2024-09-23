@implementation AMDPair

- (AMDPair)initWith:(id)a3 and:(id)a4
{
  AMDPair *v6;
  id v7;
  id location[2];
  AMDPair *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  -[AMDPair setFirstElement:](v9, "setFirstElement:", location[0]);
  -[AMDPair setSecondElement:](v9, "setSecondElement:", v7);
  v6 = v9;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v6;
}

- (id)first
{
  return -[AMDPair firstElement](self, "firstElement", a2, self);
}

- (id)second
{
  return -[AMDPair secondElement](self, "secondElement", a2, self);
}

- (id)firstElement
{
  return self->_firstElement;
}

- (void)setFirstElement:(id)a3
{
  objc_storeStrong(&self->_firstElement, a3);
}

- (id)secondElement
{
  return self->_secondElement;
}

- (void)setSecondElement:(id)a3
{
  objc_storeStrong(&self->_secondElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondElement, 0);
  objc_storeStrong(&self->_firstElement, 0);
}

@end
