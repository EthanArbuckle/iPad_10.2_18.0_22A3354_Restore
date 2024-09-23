@implementation NATimeFormatter

- (NATimeFormatter)init
{
  NATimeFormatter *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NATimeFormatter;
  v2 = -[NATimeFormatter init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    -[NATimeFormatter setElapsedDurationFormatter:](v2, "setElapsedDurationFormatter:", v3);

    -[NATimeFormatter elapsedDurationFormatter](v2, "elapsedDurationFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStyle:", 1);

    v5 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
    -[NATimeFormatter setRemainingDurationFormatter:](v2, "setRemainingDurationFormatter:", v5);

    -[NATimeFormatter remainingDurationFormatter](v2, "remainingDurationFormatter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStyle:", 2);

  }
  return v2;
}

- (id)formatElapsedDuration:(double)a3
{
  void *v4;
  void *v5;

  -[NATimeFormatter elapsedDurationFormatter](self, "elapsedDurationFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromSeconds:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formatRemainingDuration:(double)a3
{
  void *v4;
  void *v5;

  -[NATimeFormatter remainingDurationFormatter](self, "remainingDurationFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromSeconds:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AVTimeFormatter)elapsedDurationFormatter
{
  return self->_elapsedDurationFormatter;
}

- (void)setElapsedDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedDurationFormatter, a3);
}

- (AVTimeFormatter)remainingDurationFormatter
{
  return self->_remainingDurationFormatter;
}

- (void)setRemainingDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_remainingDurationFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingDurationFormatter, 0);
  objc_storeStrong((id *)&self->_elapsedDurationFormatter, 0);
}

@end
