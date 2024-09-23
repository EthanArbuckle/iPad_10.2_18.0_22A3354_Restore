@implementation AVDisplayLink

- (void)startDisplayLinkUpdatesForObserver:(id)a3 framesPerSecond:(int64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a5;
  v9 = a3;
  -[AVDisplayLink invalidate](self, "invalidate");
  -[AVDisplayLink setObserver:](self, "setObserver:", v9);

  -[AVDisplayLink setLinkFired:](self, "setLinkFired:", v8);
  objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_linkFired_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVDisplayLink setDisplayLink:](self, "setDisplayLink:", v10);

  -[AVDisplayLink displayLink](self, "displayLink");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredFramesPerSecond:", a4);

  -[AVDisplayLink setStartTime:](self, "setStartTime:", CFAbsoluteTimeGetCurrent());
  -[AVDisplayLink displayLink](self, "displayLink");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

}

- (void)invalidate
{
  void *v3;

  -[AVDisplayLink displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AVDisplayLink setDisplayLink:](self, "setDisplayLink:", 0);
  -[AVDisplayLink setLinkFired:](self, "setLinkFired:", 0);
}

- (void)linkFired:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  -[AVDisplayLink observer](self, "observer", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVDisplayLink linkFired](self, "linkFired");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    -[AVDisplayLink linkFired](self, "linkFired");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, AVDisplayLink *))v5)[2](v5, v6, self);

  }
  else
  {
    -[AVDisplayLink invalidate](self, "invalidate");
  }

}

- (double)runningTime
{
  void *v3;
  double Current;
  double v5;
  double v6;

  -[AVDisplayLink displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    -[AVDisplayLink startTime](self, "startTime");
    v6 = Current - v5;
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (id)linkFired
{
  return self->_linkFired;
}

- (void)setLinkFired:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (id)observer
{
  return objc_loadWeakRetained(&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak(&self->_observer, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observer);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_linkFired, 0);
}

@end
