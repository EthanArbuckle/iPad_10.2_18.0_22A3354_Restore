@implementation CALNGEORouteHypothesizer

- (CALNGEORouteHypothesizer)initWithRouteHypothesizer:(id)a3
{
  id v5;
  CALNGEORouteHypothesizer *v6;
  CALNGEORouteHypothesizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNGEORouteHypothesizer;
  v6 = -[CALNGEORouteHypothesizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_routeHypothesizer, a3);

  return v7;
}

- (unint64_t)state
{
  void *v2;
  unint64_t v3;

  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (EKTravelEngineHypothesis)currentHypothesis
{
  void *v2;
  void *v3;
  void *v4;

  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentHypothesis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNRouteHypothesisMapper ekTravelEngineHypothesisFromGEORouteHypothesis:](CALNRouteHypothesisMapper, "ekTravelEngineHypothesisFromGEORouteHypothesis:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKTravelEngineHypothesis *)v4;
}

- (id)updateHandler
{
  return 0;
}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startHypothesizingWithUpdateHandler:", v4);

}

- (void)requestRefresh
{
  id v2;

  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestRefresh");

}

- (void)stopHypothesizing
{
  id v2;

  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopHypothesizing");

}

- (void)didPostUINotification:(unint64_t)a3
{
  id v4;

  -[CALNGEORouteHypothesizer routeHypothesizer](self, "routeHypothesizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPostUINotification:", a3);

}

- (CADRouteHypothesis)currentCADRouteHypothesis
{
  return self->currentCADRouteHypothesis;
}

- (void)setCurrentCADRouteHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, a3);
}

- (GEORouteHypothesizer)routeHypothesizer
{
  return self->_routeHypothesizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHypothesizer, 0);
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, 0);
}

@end
