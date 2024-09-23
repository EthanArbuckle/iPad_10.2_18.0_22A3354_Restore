@implementation CALNSyntheticRouteHypothesizer

- (unint64_t)state
{
  return 1;
}

- (EKTravelEngineHypothesis)currentHypothesis
{
  void *v2;
  void *v3;

  -[CALNSyntheticRouteHypothesizer currentCADRouteHypothesis](self, "currentCADRouteHypothesis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNRouteHypothesisMapper ekTravelEngineHypothesisFromCADRouteHypothesis:](CALNRouteHypothesisMapper, "ekTravelEngineHypothesisFromCADRouteHypothesis:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKTravelEngineHypothesis *)v3;
}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[CALNSyntheticRouteHypothesizer setUpdateHandler:](self, "setUpdateHandler:", v4);

}

- (void)stopHypothesizing
{
  -[CALNSyntheticRouteHypothesizer setUpdateHandler:](self, "setUpdateHandler:", 0);
}

- (CADRouteHypothesis)currentCADRouteHypothesis
{
  return self->currentCADRouteHypothesis;
}

- (void)setCurrentCADRouteHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, 0);
}

@end
