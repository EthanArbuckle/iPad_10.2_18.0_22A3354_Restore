@implementation MUNearestStationProvider

- (void)fetchStationForLineItemIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  MKLocationManagerOperation *v9;
  MKLocationManagerOperation *locationOperation;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(id *, void *, void *);
  void *v14;
  id v15;
  void (**v16)(_QWORD);
  id v17;
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v7)
  {
    if (objc_msgSend(v6, "muid"))
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CC1810], "sharedLocationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke;
      v14 = &unk_1E2E022A8;
      objc_copyWeak(&v17, &location);
      v16 = v7;
      v15 = v6;
      objc_msgSend(v8, "singleLocationUpdateWithHandler:", &v11);
      v9 = (MKLocationManagerOperation *)objc_claimAutoreleasedReturnValue();
      locationOperation = self->_locationOperation;
      self->_locationOperation = v9;

      -[MKLocationManagerOperation start](self->_locationOperation, "start", v11, v12, v13, v14);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v7[2](v7);
    }
  }

}

void __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v6)
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      WeakRetained[3] = objc_msgSend(a1[4], "muid");
      objc_msgSend(MEMORY[0x1E0CC1848], "sharedService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      objc_msgSend(v5, "coordinate");
      v11 = v10;
      v13 = v12;
      objc_msgSend(v8, "defaultTraits");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ticketForNearestTransitStation:coordinate:traits:", v9, v14, v11, v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)WeakRetained[2];
      WeakRetained[2] = v15;

      v17 = (void *)WeakRetained[2];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke_2;
      v18[3] = &unk_1E2E01FD0;
      objc_copyWeak(&v20, a1 + 6);
      v19 = a1[5];
      objc_msgSend(v17, "submitWithHandler:networkActivity:", v18, 0);

      objc_destroyWeak(&v20);
    }
  }

}

void __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      WeakRetained[3] = 0;
      v8 = v5;
      v9 = (void *)v7[5];
      v7[5] = v8;
    }
    else
    {
      v10 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;

      objc_msgSend(v12, "firstObject");
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v7[4];
      v7[4] = v11;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)cancel
{
  -[MKLocationManagerOperation cancel](self->_locationOperation, "cancel");
  -[MKMapServiceTicket cancel](self->_nearestStationTicket, "cancel");
  self->_lastRequestedNearestID = 0;
}

- (unint64_t)lastRequestedNearestID
{
  return self->_lastRequestedNearestID;
}

- (MKMapItem)nearestStation
{
  return self->_nearestStation;
}

- (NSError)nearestStationError
{
  return self->_nearestStationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestStationError, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_nearestStationTicket, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
}

@end
