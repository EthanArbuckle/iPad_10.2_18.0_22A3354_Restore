@implementation CDMContextUpdateResponseCommand

- (CDMContextUpdateResponseCommand)initWithCtxUpdateResponse:(id)a3
{
  id v5;
  CDMContextUpdateResponseCommand *v6;
  CDMContextUpdateResponseCommand *v7;
  SIRINLUEXTERNALCorrectionOutcome *correctionOutcome;
  void *v9;
  uint64_t v10;
  SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *firstReformedInput;
  SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *v12;
  uint64_t v13;
  SIRINLUEXTERNALCorrectionOutcome *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CDMContextUpdateResponseCommand;
  v6 = -[CDMBaseCommand init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ctxUpdateResponse, a3);
    correctionOutcome = v7->_correctionOutcome;
    v7->_correctionOutcome = 0;

    objc_msgSend(v5, "reformedTurnInputBundles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    firstReformedInput = v7->_firstReformedInput;
    v7->_firstReformedInput = (SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle *)v10;

    v12 = v7->_firstReformedInput;
    if (v12)
    {
      if (-[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle type](v12, "type") == 1
        || -[SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle type](v7->_firstReformedInput, "type") == 3)
      {
        v13 = objc_opt_new();
        v14 = v7->_correctionOutcome;
        v7->_correctionOutcome = (SIRINLUEXTERNALCorrectionOutcome *)v13;

        -[SIRINLUEXTERNALCorrectionOutcome setType:](v7->_correctionOutcome, "setType:", 1);
      }
    }
  }

  return v7;
}

- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateResponse)ctxUpdateResponse
{
  return self->_ctxUpdateResponse;
}

- (void)setCtxUpdateResponse:(id)a3
{
  objc_storeStrong((id *)&self->_ctxUpdateResponse, a3);
}

- (SIRINLUINTERNALCONTEXTUPDATEReformedTurnInputBundle)firstReformedInput
{
  return self->_firstReformedInput;
}

- (void)setFirstReformedInput:(id)a3
{
  objc_storeStrong((id *)&self->_firstReformedInput, a3);
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (void)setCorrectionOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_correctionOutcome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
  objc_storeStrong((id *)&self->_firstReformedInput, 0);
  objc_storeStrong((id *)&self->_ctxUpdateResponse, 0);
}

@end
