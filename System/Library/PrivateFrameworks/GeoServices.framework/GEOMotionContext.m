@implementation GEOMotionContext

- (void)dealloc
{
  objc_super v3;

  -[GEOMotionContext stopMotionUpdates](self, "stopMotionUpdates");
  v3.receiver = self;
  v3.super_class = (Class)GEOMotionContext;
  -[GEOMotionContext dealloc](&v3, sel_dealloc);
}

- (void)startMotionUpdatesWithProvider:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_provider, a3);
  v5 = a3;
  -[GEOMotionContextProvider setMotionDelegate:](self->_provider, "setMotionDelegate:", self);
  -[GEOMotionContextProvider startMotionUpdates](self->_provider, "startMotionUpdates");

}

- (void)stopMotionUpdates
{
  GEOMotionContextProvider *provider;

  -[GEOMotionContextProvider stopMotionUpdates](self->_provider, "stopMotionUpdates");
  provider = self->_provider;
  self->_provider = 0;

}

- (BOOL)isMoving
{
  return self->_motionType & 1;
}

- (BOOL)isWalking
{
  return (LOBYTE(self->_motionType) >> 1) & 1;
}

- (BOOL)isRunning
{
  return (LOBYTE(self->_motionType) >> 2) & 1;
}

- (BOOL)isCycling
{
  return (LOBYTE(self->_motionType) >> 3) & 1;
}

- (BOOL)isDriving
{
  return (LOBYTE(self->_motionType) >> 4) & 1;
}

- (void)motionContextProvider:(id)a3 didUpdateMotion:(unint64_t)a4 exitType:(unint64_t)a5 confidence:(unint64_t)a6
{
  id WeakRetained;

  self->_motionType = a4;
  self->_exitType = a5;
  self->_confidence = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "motionContextDidUpdateMotion:", self);

}

- (NSString)description
{
  const __CFString *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  if (-[GEOMotionContext isWalking](self, "isWalking"))
  {
    v3 = CFSTR("Walking");
  }
  else if (-[GEOMotionContext isRunning](self, "isRunning"))
  {
    v3 = CFSTR("Running");
  }
  else if (-[GEOMotionContext isCycling](self, "isCycling"))
  {
    v3 = CFSTR("Cycling");
  }
  else if (-[GEOMotionContext isDriving](self, "isDriving"))
  {
    v3 = CFSTR("Driving");
  }
  else if (-[GEOMotionContext isMoving](self, "isMoving"))
  {
    v3 = CFSTR("Moving");
  }
  else
  {
    v3 = CFSTR("No motion");
  }
  if (-[GEOMotionContext exitType](self, "exitType"))
  {
    v4 = -[GEOMotionContext exitType](self, "exitType");
    v5 = CFSTR("may be exiting vehicle");
    if (v4 == 2)
      v5 = CFSTR("exited vehicle");
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, %@, (%d)"), v3, v7, -[GEOMotionContext confidence](self, "confidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%d)"), v3, -[GEOMotionContext confidence](self, "confidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v8;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (unint64_t)exitType
{
  return self->_exitType;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (GEOMotionContextDelegate)delegate
{
  return (GEOMotionContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
