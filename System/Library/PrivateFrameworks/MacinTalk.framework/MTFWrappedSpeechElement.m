@implementation MTFWrappedSpeechElement

- (MTFWrappedSpeechElement)initWithCppElement:(void *)a3
{
  MTFWrappedSpeechElement *v4;
  MTFWrappedSpeechElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTFWrappedSpeechElement;
  v4 = -[MTFWrappedSpeechElement init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[MTFWrappedSpeechElement setWrapped:](v4, "setWrapped:", a3);
  return v5;
}

- (MTFWrappedSpeechElement)FirstChild
{
  void *v2;

  +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", (_QWORD)-[MTFWrappedSpeechElement elem](self, "elem")[16]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnOwned:", 1);
  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)LastChild
{
  void *v2;

  +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", (_QWORD)-[MTFWrappedSpeechElement elem](self, "elem")[24]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnOwned:", 1);
  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)Parent
{
  void *v2;

  +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", (_QWORD)-[MTFWrappedSpeechElement elem](self, "elem")[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnOwned:", 1);
  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)NextSibling
{
  void *v2;

  +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", (_QWORD)-[MTFWrappedSpeechElement elem](self, "elem")[40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnOwned:", 1);
  return (MTFWrappedSpeechElement *)v2;
}

- (MTFWrappedSpeechElement)PrevSibling
{
  void *v2;

  +[MTFWrappedSpeechElement fromCPPElement:](MTFWrappedSpeechElement, "fromCPPElement:", (_QWORD)-[MTFWrappedSpeechElement elem](self, "elem")[48]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUnOwned:", 1);
  return (MTFWrappedSpeechElement *)v2;
}

+ (id)fromCPPElement:(void *)a3
{
  void *v4;
  void *v5;
  __objc2_class **v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    if (v4)
    {
      v5 = v4;
      v6 = off_1E9364B20;
    }
    else
    {
      if (v8)
      {
        v5 = v8;
        v6 = off_1E9364B10;
      }
      else
      {
        if (v9)
        {
          v5 = v9;
          v6 = off_1E9364B08;
        }
        else
        {
          if (v10)
          {
            v5 = v10;
            v6 = off_1E9364B38;
          }
          else
          {
            if (v11)
            {
              v5 = v11;
              v6 = off_1E9364B00;
            }
            else
            {
              if (v12)
              {
                v5 = v12;
                v6 = off_1E9364B30;
              }
              else
              {
                if (v13)
                {
                  v5 = v13;
                  v6 = off_1E9364B18;
                }
                else
                {
                  v6 = off_1E9364AF8;
                  if (v14)
                  {
                    v5 = v14;
                  }
                  else
                  {
                    v6 = off_1E9364B28;
                    v5 = a3;
                  }
                }
              }
            }
          }
        }
      }
    }
    v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithCppElement:", v5);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)dealloc
{
  MTFESpeechElement *v3;
  objc_super v4;

  if (!-[MTFWrappedSpeechElement unOwned](self, "unOwned"))
  {
    v3 = -[MTFWrappedSpeechElement elem](self, "elem");
    if (v3)
      (*((void (**)(MTFESpeechElement *))v3->var0 + 2))(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTFWrappedSpeechElement;
  -[MTFWrappedSpeechElement dealloc](&v4, sel_dealloc);
}

- (void)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(void *)a3
{
  self->_wrapped = a3;
}

- (BOOL)unOwned
{
  return self->_unOwned;
}

- (void)setUnOwned:(BOOL)a3
{
  self->_unOwned = a3;
}

- (int)NumChildren
{
  return self->_NumChildren;
}

@end
