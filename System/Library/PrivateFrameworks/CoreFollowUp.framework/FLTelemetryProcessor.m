@implementation FLTelemetryProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryController, 0);
}

- (FLTelemetryProcessor)initWithController:(id)a3
{
  id v5;
  FLTelemetryProcessor *v6;
  FLTelemetryProcessor *v7;

  v5 = a3;
  v6 = -[FLTelemetryProcessor init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_telemetryController, a3);

  return v7;
}

- (void)processItemRemoval:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.followup.tests"));

  if ((v5 & 1) == 0)
    -[FLTelemetryController captureItemRemoval:](self->_telemetryController, "captureItemRemoval:", v6);

}

- (void)processItemAddition:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.followup.tests"));

  if ((v5 & 1) == 0)
    -[FLTelemetryController captureItemAddition:](self->_telemetryController, "captureItemAddition:", v6);

}

- (void)processCurrentItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithBlock:", &__block_literal_global);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[FLTelemetryController captureCurrentState:](self->_telemetryController, "captureCurrentState:", v7);
}

uint64_t __44__FLTelemetryProcessor_processCurrentItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "clientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.followup.tests")) ^ 1;

  return v3;
}

@end
