@implementation CPSPointsOfInterestMapViewController

- (CPSPointsOfInterestMapViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  CPSPointsOfInterestMapViewController *v4;
  CPSPointsOfInterestPickerViewController *v5;
  uint64_t v6;
  CPSPointsOfInterestPickerViewController *pickerViewController;
  NSMutableDictionary *v8;
  NSMutableDictionary *clusterAnnotations;
  CPSPointsOfInterestMapViewController *v11;
  id v12;
  id v13;
  id v14;
  CPSPointsOfInterestMapViewController *v16;
  objc_super v17;
  id v18;
  id v19;
  id location[2];
  CPSPointsOfInterestMapViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = location[0];
  v4 = v21;
  v21 = 0;
  v17.receiver = v4;
  v17.super_class = (Class)CPSPointsOfInterestMapViewController;
  v16 = -[CPSBaseEntityContentViewController initWithEntity:resourceProvider:](&v17, sel_initWithEntity_resourceProvider_, v18, v19);
  v21 = v16;
  objc_storeStrong((id *)&v21, v16);
  if (v16)
  {
    v5 = [CPSPointsOfInterestPickerViewController alloc];
    v6 = -[CPSPointsOfInterestPickerViewController initWithEntity:resourceProvider:](v5, "initWithEntity:resourceProvider:", location[0], v19);
    pickerViewController = v21->_pickerViewController;
    v21->_pickerViewController = (CPSPointsOfInterestPickerViewController *)v6;

    v14 = +[CPSEntityStyles mapButtonDropShadow](CPSEntityStyles, "mapButtonDropShadow");
    v13 = (id)-[CPSPointsOfInterestPickerViewController view](v21->_pickerViewController, "view");
    v12 = (id)objc_msgSend(v13, "layer");
    objc_msgSend(v14, "applyShadowToLayer:");

    -[CPSPointsOfInterestPickerViewController setDelegate:](v21->_pickerViewController, "setDelegate:", v21);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clusterAnnotations = v21->_clusterAnnotations;
    v21->_clusterAnnotations = v8;

  }
  v11 = v21;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v21, 0);
  return v11;
}

- (id)pointsOfInterest
{
  return -[CPSBaseEntityContentViewController entity](self, "entity", a2, self);
}

- (id)template
{
  void *v3;
  CPEntityProviding *v4;
  CPSEntityResourceProvider *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  v5 = -[CPSBaseEntityContentViewController resourceProvider](self, "resourceProvider");
  v4 = -[CPSEntityResourceProvider entityTemplate](v5, "entityTemplate");
  v6 = CPSSafeCast_9(v3, v4);

  return v6;
}

- (CLLocation)userLocation
{
  CLLocationManager *v3;
  CLLocation *v4;

  v3 = -[CPSPointsOfInterestMapViewController locationManager](self, "locationManager");
  v4 = -[CLLocationManager location](v3, "location");

  return v4;
}

- (void)didUpdateEntity:(id)a3
{
  CPSPointOfInterestAnnotation *v3;
  CPSPointOfInterestAnnotation *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSMutableDictionary *annotations;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  CPSPointsOfInterestPickerViewController *pickerViewController;
  CPEntity *v19;
  id v20;
  id obj;
  uint64_t v22;
  id v23;
  _QWORD __b[8];
  id v25;
  id v26;
  id v27;
  objc_super v28;
  id location[2];
  CPSPointsOfInterestMapViewController *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28.receiver = v30;
  v28.super_class = (Class)CPSPointsOfInterestMapViewController;
  -[CPSBaseEntityContentViewController didUpdateEntity:](&v28, sel_didUpdateEntity_, location[0]);
  pickerViewController = v30->_pickerViewController;
  v19 = -[CPSBaseEntityContentViewController entity](v30, "entity");
  -[CPSBaseEntityContentViewController updateWithEntity:](pickerViewController, "updateWithEntity:");

  v20 = -[CPSPointsOfInterestMapViewController pointsOfInterest](v30, "pointsOfInterest");
  v27 = (id)objc_msgSend(v20, "pointsOfInterest");

  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v27, "count"));
  memset(__b, 0, sizeof(__b));
  obj = v27;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
  if (v22)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v22;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(obj);
      v25 = *(id *)(__b[1] + 8 * v16);
      annotations = v30->_annotations;
      v10 = (id)objc_msgSend(v25, "identifier");
      v23 = (id)-[NSMutableDictionary objectForKeyedSubscript:](annotations, "objectForKeyedSubscript:");

      v11 = v27;
      v12 = (id)objc_msgSend(v23, "pointOfInterest");
      v13 = (objc_msgSend(v11, "containsObject:") & 1) != 0;

      if (!v13)
      {
        v3 = [CPSPointOfInterestAnnotation alloc];
        v4 = -[CPSPointOfInterestAnnotation initWithPointOfInterest:](v3, "initWithPointOfInterest:", v25);
        v5 = v23;
        v23 = v4;

      }
      v6 = v23;
      v7 = v26;
      v8 = (id)objc_msgSend(v25, "identifier");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6);

      objc_storeStrong(&v23, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
        if (!v17)
          break;
      }
    }
  }

  objc_storeStrong((id *)&v30->_annotations, v26);
  -[CPSPointsOfInterestMapViewController reloadAnnotations:](v30, "reloadAnnotations:", !-[CPSPointsOfInterestMapViewController hasPerformedInitialLayout](v30, "hasPerformedInitialLayout"));
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSPointsOfInterestMapViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestMapViewController;
  -[CPSPointsOfInterestMapViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSPointsOfInterestMapViewController setupViews](v4, "setupViews");
}

- (void)viewDidLayoutSubviews
{
  NSMutableDictionary *v2;
  int v3;
  objc_super v4;
  SEL v5;
  CPSPointsOfInterestMapViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSPointsOfInterestMapViewController;
  -[CPSPointsOfInterestMapViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  v2 = -[CPSPointsOfInterestMapViewController annotations](v6, "annotations");
  LOBYTE(v3) = 0;
  if (-[NSMutableDictionary count](v2, "count"))
    v3 = !-[CPSPointsOfInterestMapViewController hasPerformedInitialLayout](v6, "hasPerformedInitialLayout");

  if ((v3 & 1) != 0)
    -[CPSPointsOfInterestMapViewController reloadAnnotations:](v6, "reloadAnnotations:", 1);
  else
    -[CPSPointsOfInterestMapViewController updateMapViewEdgeInsetsFittingAnnotations:](v6, "updateMapViewEdgeInsetsFittingAnnotations:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  CLLocationManager *v3;
  CLLocationManager *v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSPointsOfInterestMapViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSPointsOfInterestMapViewController;
  -[CPSPointsOfInterestMapViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v4 = -[CPSPointsOfInterestMapViewController locationManager](v8, "locationManager");

  if (v4)
  {
    v3 = -[CPSPointsOfInterestMapViewController locationManager](v8, "locationManager");
    -[CLLocationManager startUpdatingLocation](v3, "startUpdatingLocation");

  }
}

- (void)didMoveToParentViewController:(id)a3
{
  CLLocationManager *v3;
  objc_super v4;
  id location[2];
  CPSPointsOfInterestMapViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)CPSPointsOfInterestMapViewController;
  -[CPSPointsOfInterestMapViewController didMoveToParentViewController:](&v4, sel_didMoveToParentViewController_, location[0]);
  if (!location[0])
  {
    v3 = -[CPSPointsOfInterestMapViewController locationManager](v6, "locationManager");
    -[CLLocationManager stopUpdatingLocation](v3, "stopUpdatingLocation");

  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  id v2;
  NSArray *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSLayoutXAxisAnchor *v19;
  UILayoutGuide *v20;
  id v21;
  id v22;
  NSLayoutXAxisAnchor *v23;
  UILayoutGuide *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSLayoutXAxisAnchor *v40;
  UILayoutGuide *v41;
  id v42;
  id v43;
  NSLayoutXAxisAnchor *v44;
  UILayoutGuide *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  NSLayoutXAxisAnchor *v77;
  UILayoutGuide *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  NSLayoutXAxisAnchor *v83;
  UILayoutGuide *v84;
  CPSTemplateEnvironment *v85;
  CPSEntityResourceProvider *v86;
  BOOL v87;
  double v88;
  CPSPointsOfInterestPickerViewController *v89;
  CPSPointsOfInterestMapControlsViewController *v90;
  id v91;
  double v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  id v101;
  MKMapView *v102;
  MKMapView *v103;
  id v104;
  id v105;
  UILayoutGuide *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  NSLayoutYAxisAnchor *v113;
  UILayoutGuide *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  NSLayoutYAxisAnchor *v119;
  UILayoutGuide *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  MKMapView *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  MKMapView *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  MKMapView *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  MKMapView *v140;
  CPSPointsOfInterestMapControlsViewController *v141;
  CPSPointsOfInterestPickerViewController *v142;
  CPSPointsOfInterestMapControlsViewController *v143;
  id obj;
  uint64_t v145;
  id location;
  id v147;
  _QWORD __b[8];
  id v149;
  id v150;
  id v151[2];
  CPSPointsOfInterestMapViewController *v152;
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[6];
  _BYTE v159[128];
  _QWORD v160[2];
  _QWORD v161[7];
  CGRect v162;

  v161[6] = *MEMORY[0x24BDAC8D0];
  v152 = self;
  v151[1] = (id)a2;
  v101 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v100 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  objc_msgSend(v100, "setBackgroundColor:", v101);

  v151[0] = (id)objc_opt_new();
  -[CPSPointsOfInterestMapViewController setUpLocationManager](v152, "setUpLocationManager");
  -[CPSPointsOfInterestMapViewController setUpMapView](v152, "setUpMapView");
  v102 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v102, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v104 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v103 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  objc_msgSend(v104, "addSubview:");

  v105 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  -[CPSPointsOfInterestMapViewController setMapVisibleRegionGuide:](v152, "setMapVisibleRegionGuide:");

  v107 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v106 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
  objc_msgSend(v107, "addLayoutGuide:");

  v140 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  v139 = (id)-[MKMapView topAnchor](v140, "topAnchor");
  v138 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v137 = (id)objc_msgSend(v138, "topAnchor");
  v136 = (id)objc_msgSend(v139, "constraintEqualToAnchor:");
  v161[0] = v136;
  v135 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  v134 = (id)-[MKMapView bottomAnchor](v135, "bottomAnchor");
  v133 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v132 = (id)objc_msgSend(v133, "bottomAnchor");
  v131 = (id)objc_msgSend(v134, "constraintEqualToAnchor:");
  v161[1] = v131;
  v130 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  v129 = (id)-[MKMapView leftAnchor](v130, "leftAnchor");
  v128 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v127 = (id)objc_msgSend(v128, "leftAnchor");
  v126 = (id)objc_msgSend(v129, "constraintEqualToAnchor:");
  v161[2] = v126;
  v125 = -[CPSPointsOfInterestMapViewController mapView](v152, "mapView");
  v124 = (id)-[MKMapView rightAnchor](v125, "rightAnchor");
  v123 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v122 = (id)objc_msgSend(v123, "rightAnchor");
  v121 = (id)objc_msgSend(v124, "constraintEqualToAnchor:");
  v161[3] = v121;
  v120 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
  v119 = -[UILayoutGuide topAnchor](v120, "topAnchor");
  v118 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v117 = (id)objc_msgSend(v118, "safeAreaLayoutGuide");
  v116 = (id)objc_msgSend(v117, "topAnchor");
  v115 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v119, "constraintEqualToAnchor:");
  v161[4] = v115;
  v114 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
  v113 = -[UILayoutGuide bottomAnchor](v114, "bottomAnchor");
  v112 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v111 = (id)objc_msgSend(v112, "safeAreaLayoutGuide");
  v110 = (id)objc_msgSend(v111, "bottomAnchor");
  v109 = (id)-[NSLayoutYAxisAnchor constraintEqualToAnchor:](v113, "constraintEqualToAnchor:");
  v161[5] = v109;
  v108 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v161, 6);
  objc_msgSend(v151[0], "addObjectsFromArray:");

  v141 = -[CPSPointsOfInterestMapControlsViewController initWithMapDelegate:]([CPSPointsOfInterestMapControlsViewController alloc], "initWithMapDelegate:", v152);
  -[CPSPointsOfInterestMapViewController setMapControlsViewController:](v152, "setMapControlsViewController:");

  v143 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v152, "mapControlsViewController");
  v160[0] = v143;
  v142 = -[CPSPointsOfInterestMapViewController pickerViewController](v152, "pickerViewController");
  v160[1] = v142;
  v150 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 2);

  memset(__b, 0, sizeof(__b));
  obj = v150;
  v145 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v159, 16);
  if (v145)
  {
    v97 = *(_QWORD *)__b[2];
    v98 = 0;
    v99 = v145;
    while (1)
    {
      v96 = v98;
      if (*(_QWORD *)__b[2] != v97)
        objc_enumerationMutation(obj);
      v149 = *(id *)(__b[1] + 8 * v98);
      objc_msgSend(v149, "willMoveToParentViewController:", v152);
      -[CPSPointsOfInterestMapViewController addChildViewController:](v152, "addChildViewController:", v149);
      v93 = (id)objc_msgSend(v149, "view");
      objc_msgSend(v93, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v95 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
      v94 = (id)objc_msgSend(v149, "view");
      objc_msgSend(v95, "addSubview:");

      objc_msgSend(v149, "didMoveToParentViewController:", v152);
      ++v98;
      if (v96 + 1 >= v99)
      {
        v98 = 0;
        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v159, 16);
        if (!v99)
          break;
      }
    }
  }

  v89 = -[CPSPointsOfInterestMapViewController pickerViewController](v152, "pickerViewController");
  v147 = (id)-[CPSPointsOfInterestPickerViewController view](v89, "view");

  v90 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v152, "mapControlsViewController");
  location = (id)-[CPSPointsOfInterestMapControlsViewController view](v90, "view");

  v91 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  objc_msgSend(v91, "frame");
  v92 = CGRectGetWidth(v162) * 0.45;

  if (v92 >= 200.0)
    v88 = 200.0;
  else
    v88 = v92;
  v46 = v151[0];
  v71 = (id)objc_msgSend(v147, "topAnchor");
  v70 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v69 = (id)objc_msgSend(v70, "safeAreaLayoutGuide");
  v68 = (id)objc_msgSend(v69, "topAnchor");
  v67 = (id)objc_msgSend(v71, "constraintEqualToAnchor:constant:");
  v158[0] = v67;
  v66 = (id)objc_msgSend(v147, "bottomAnchor");
  v65 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v64 = (id)objc_msgSend(v65, "safeAreaLayoutGuide");
  v63 = (id)objc_msgSend(v64, "bottomAnchor");
  v62 = (id)objc_msgSend(v66, "constraintEqualToAnchor:constant:");
  v158[1] = v62;
  v61 = (id)objc_msgSend(v147, "widthAnchor");
  v60 = (id)objc_msgSend(v61, "constraintEqualToConstant:", v88);
  v158[2] = v60;
  v59 = (id)objc_msgSend(location, "topAnchor");
  v58 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v57 = (id)objc_msgSend(v58, "safeAreaLayoutGuide");
  v56 = (id)objc_msgSend(v57, "topAnchor");
  v55 = (id)objc_msgSend(v59, "constraintEqualToAnchor:constant:", 8.0);
  v158[3] = v55;
  v54 = (id)objc_msgSend(location, "bottomAnchor");
  v53 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v52 = (id)objc_msgSend(v53, "safeAreaLayoutGuide");
  v51 = (id)objc_msgSend(v52, "bottomAnchor");
  v50 = (id)objc_msgSend(v54, "constraintEqualToAnchor:constant:", -8.0);
  v158[4] = v50;
  v49 = (id)objc_msgSend(location, "widthAnchor");
  v48 = (id)objc_msgSend(v49, "constraintEqualToConstant:", 28.0);
  v158[5] = v48;
  v47 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 6);
  objc_msgSend(v46, "addObjectsFromArray:");

  v84 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
  v83 = -[UILayoutGuide leftAnchor](v84, "leftAnchor");
  v82 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v81 = (id)objc_msgSend(v82, "safeAreaLayoutGuide");
  v80 = (id)objc_msgSend(v81, "leftAnchor");
  v79 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v83, "constraintEqualToAnchor:");
  v157[0] = v79;
  v78 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
  v77 = -[UILayoutGuide rightAnchor](v78, "rightAnchor");
  v76 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
  v75 = (id)objc_msgSend(v76, "safeAreaLayoutGuide");
  v74 = (id)objc_msgSend(v75, "rightAnchor");
  v73 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v77, "constraintEqualToAnchor:");
  v157[1] = v73;
  v72 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v157, 2);
  -[CPSPointsOfInterestMapViewController setPanModeConstraints:](v152, "setPanModeConstraints:");

  v86 = -[CPSBaseEntityContentViewController resourceProvider](v152, "resourceProvider");
  v85 = -[CPSEntityResourceProvider templateEnvironment](v86, "templateEnvironment");
  v87 = -[CPSTemplateEnvironment rightHandDrive](v85, "rightHandDrive");

  if (v87)
  {
    v25 = v151[0];
    v36 = (id)objc_msgSend(location, "leftAnchor");
    v35 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
    v34 = (id)objc_msgSend(v35, "safeAreaLayoutGuide");
    v33 = (id)objc_msgSend(v34, "leftAnchor");
    v32 = (id)objc_msgSend(v36, "constraintEqualToAnchor:constant:", 8.0);
    v156[0] = v32;
    v31 = (id)objc_msgSend(v147, "rightAnchor");
    v30 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
    v29 = (id)objc_msgSend(v30, "safeAreaLayoutGuide");
    v28 = (id)objc_msgSend(v29, "rightAnchor");
    v27 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", -8.0);
    v156[1] = v27;
    v26 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v156);
    objc_msgSend(v25, "addObjectsFromArray:");

    v45 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
    v44 = -[UILayoutGuide leftAnchor](v45, "leftAnchor");
    v43 = (id)objc_msgSend(location, "rightAnchor");
    v42 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v44, "constraintEqualToAnchor:");
    v155[0] = v42;
    v41 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
    v40 = -[UILayoutGuide rightAnchor](v41, "rightAnchor");
    v39 = (id)objc_msgSend(v147, "leftAnchor");
    v38 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v40, "constraintEqualToAnchor:");
    v155[1] = v38;
    v37 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v155, 2);
    -[CPSPointsOfInterestMapViewController setPickerModeConstraints:](v152, "setPickerModeConstraints:");

  }
  else
  {
    v4 = v151[0];
    v15 = (id)objc_msgSend(v147, "leftAnchor");
    v14 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
    v13 = (id)objc_msgSend(v14, "safeAreaLayoutGuide");
    v12 = (id)objc_msgSend(v13, "leftAnchor");
    v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 8.0);
    v154[0] = v11;
    v10 = (id)objc_msgSend(location, "rightAnchor");
    v9 = (id)-[CPSPointsOfInterestMapViewController view](v152, "view");
    v8 = (id)objc_msgSend(v9, "safeAreaLayoutGuide");
    v7 = (id)objc_msgSend(v8, "rightAnchor");
    v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", -8.0);
    v154[1] = v6;
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154);
    objc_msgSend(v4, "addObjectsFromArray:");

    v24 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
    v23 = -[UILayoutGuide leftAnchor](v24, "leftAnchor");
    v22 = (id)objc_msgSend(v147, "rightAnchor");
    v21 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v23, "constraintEqualToAnchor:");
    v153[0] = v21;
    v20 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v152, "mapVisibleRegionGuide");
    v19 = -[UILayoutGuide rightAnchor](v20, "rightAnchor");
    v18 = (id)objc_msgSend(location, "leftAnchor");
    v17 = (id)-[NSLayoutXAxisAnchor constraintEqualToAnchor:](v19, "constraintEqualToAnchor:");
    v153[1] = v17;
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v153, 2);
    -[CPSPointsOfInterestMapViewController setPickerModeConstraints:](v152, "setPickerModeConstraints:");

  }
  v2 = v151[0];
  v3 = -[CPSPointsOfInterestMapViewController pickerModeConstraints](v152, "pickerModeConstraints");
  objc_msgSend(v2, "addObjectsFromArray:");

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v151[0]);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v147, 0);
  objc_storeStrong(&v150, 0);
  objc_storeStrong(v151, 0);
}

- (void)setUpMapView
{
  id v2;
  Class v3;
  MKMapView *mapView;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  CPSTemplateEnvironment *v10;
  CPSEntityResourceProvider *v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  MKMapView *v16;
  MKMapView *v17;
  MKMapView *v18;
  MKMapView *v19;
  MKMapView *v20;
  id obj;
  uint64_t v22;
  _QWORD __b[8];
  Class v24;
  id location;
  id v26;
  id v27[2];
  CPSPointsOfInterestMapViewController *v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  v27[1] = (id)a2;
  v11 = -[CPSBaseEntityContentViewController resourceProvider](self, "resourceProvider");
  v10 = -[CPSEntityResourceProvider templateEnvironment](v11, "templateEnvironment");
  v27[0] = -[CPSTemplateEnvironment bundleIdentifier](v10, "bundleIdentifier");

  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v30[3] = objc_opt_class();
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v12 = objc_alloc(MEMORY[0x24BDBFA88]);
  v13 = MEMORY[0x24BDAC9B8];
  location = (id)objc_msgSend(v12, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v27[0], v28);

  v2 = objc_alloc(MEMORY[0x24BDDB130]);
  v14 = (id)objc_msgSend(v2, "initWithFrame:locationManager:", location, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[CPSPointsOfInterestMapViewController setMapView:](v28, "setMapView:");

  v15 = -[CPSPointsOfInterestMapViewController isLocationAuthorized](v28, "isLocationAuthorized");
  v16 = -[CPSPointsOfInterestMapViewController mapView](v28, "mapView");
  -[MKMapView setShowsUserLocation:](v16, "setShowsUserLocation:", v15);

  v17 = -[CPSPointsOfInterestMapViewController mapView](v28, "mapView");
  -[MKMapView setShowsAttribution:](v17, "setShowsAttribution:", 0);

  v18 = -[CPSPointsOfInterestMapViewController mapView](v28, "mapView");
  -[MKMapView setMapType:](v18, "setMapType:");

  v19 = -[CPSPointsOfInterestMapViewController mapView](v28, "mapView");
  -[MKMapView setDelegate:](v19, "setDelegate:", v28);

  v20 = -[CPSPointsOfInterestMapViewController mapView](v28, "mapView");
  -[MKMapView setIsAccessibilityElement:](v20, "setIsAccessibilityElement:", 0);

  memset(__b, 0, sizeof(__b));
  obj = v26;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v22)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v22;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v24 = 0;
      v24 = *(Class *)(__b[1] + 8 * v8);
      mapView = v28->_mapView;
      v3 = v24;
      v5 = NSStringFromClass(v24);
      -[MKMapView registerClass:forAnnotationViewWithReuseIdentifier:](mapView, "registerClass:forAnnotationViewWithReuseIdentifier:", v3);

      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v9)
          break;
      }
    }
  }

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v27, 0);
}

- (void)updateMapViewEdgeInsetsFittingAnnotations:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  MKMapView *v35;
  void *v36;
  UILayoutGuide *v37;
  MKMapView *v38;
  MKMapView *v39;
  MKMapCamera *v40;
  MKMapView *v41;
  NSMutableDictionary *v42;
  id v43;
  UILayoutGuide *v44;
  MKMapView *v45;
  BOOL v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  CPSPointsOfInterestMapViewController *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  double v62;
  double v63;
  __int128 v65;
  double v66;
  double v67;
  id v68;
  __int128 v69;
  __int128 v70;
  id v71;
  __int128 v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  double v86;
  double v87;
  double v88;
  BOOL v89;
  SEL v90;
  CPSPointsOfInterestMapViewController *v91;

  v91 = self;
  v90 = a2;
  v89 = a3;
  v44 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](self, "mapVisibleRegionGuide");
  -[UILayoutGuide layoutFrame](v44, "layoutFrame");
  v81 = v3;
  v82 = v4;
  v83 = v5;
  v84 = v6;
  v43 = (id)-[CPSPointsOfInterestMapViewController view](v91, "view");
  objc_msgSend(v43, "bounds");
  v77 = v7;
  v78 = v8;
  v79 = v9;
  v80 = v10;
  UIEdgeInsetsFromRectWithRect();
  v85 = v11;
  v86 = v12;
  v87 = v13;
  v88 = v14;

  v45 = -[CPSPointsOfInterestMapViewController mapView](v91, "mapView");
  -[MKMapView _edgeInsets](v45, "_edgeInsets");
  v73 = v15;
  v74 = v16;
  v75 = v17;
  v76 = v18;
  v46 = UIEdgeInsetsEqualToEdgeInsets(v85, v86, v87, v88, v15, v16, v17, v18);

  if (!v46)
  {
    v38 = -[CPSPointsOfInterestMapViewController mapView](v91, "mapView");
    -[MKMapView centerCoordinate](v38, "centerCoordinate");
    *(_QWORD *)&v72 = v19;
    *((_QWORD *)&v72 + 1) = v20;

    v39 = -[CPSPointsOfInterestMapViewController mapView](v91, "mapView");
    -[MKMapView _setEdgeInsets:](v39, "_setEdgeInsets:", v85, v86, v87, v88);

    v41 = -[CPSPointsOfInterestMapViewController mapView](v91, "mapView");
    v40 = -[MKMapView camera](v41, "camera");
    v71 = (id)-[MKMapCamera copy](v40, "copy");

    v70 = v72;
    v69 = v72;
    objc_msgSend(v71, "setCenterCoordinate:", v72);
    v42 = -[CPSPointsOfInterestMapViewController annotations](v91, "annotations");
    v68 = (id)-[NSMutableDictionary allValues](v42, "allValues");

    if (v89 && objc_msgSend(v68, "count"))
    {
      -[CPSPointsOfInterestMapViewController mapVisibleRegion](v91, "mapVisibleRegion");
      *(double *)&v65 = v21;
      *((double *)&v65 + 1) = v22;
      v66 = v23;
      v67 = v24;
      if (CPSCoordinateRegionContainsAnnotations(v68, v21, v22, v23, v24) & 1)
      {
        v54 = v65;
        v53 = v65;
        objc_msgSend(v71, "setCenterCoordinate:", v65);
      }
      else
      {
        *(_QWORD *)&v61 = CPSCoordinateRegionForAnnotations(v68);
        *((_QWORD *)&v61 + 1) = v26;
        v62 = v27;
        v63 = v25;
        if (v25 <= v67)
        {
          v56 = v61;
          v55 = v61;
          objc_msgSend(v71, "setCenterCoordinate:", v61);
        }
        else
        {
          v36 = (void *)MEMORY[0x24BDDB0D0];
          v37 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](v91, "mapVisibleRegionGuide", v25);
          -[UILayoutGuide layoutFrame](v37, "layoutFrame");
          v57 = v28;
          v58 = v29;
          *(double *)&v59 = v30;
          *((double *)&v59 + 1) = v31;
          v60 = v59;
          v32 = (id)objc_msgSend(v36, "_CPS_cameraForRegion:withSize:", *(double *)&v61, *((double *)&v61 + 1), v62, v63, v30, v31);
          v33 = v71;
          v71 = v32;

        }
      }
    }
    v35 = -[CPSPointsOfInterestMapViewController mapView](v91, "mapView");
    v34 = v71;
    v47 = MEMORY[0x24BDAC760];
    v48 = -1073741824;
    v49 = 0;
    v50 = __82__CPSPointsOfInterestMapViewController_updateMapViewEdgeInsetsFittingAnnotations___block_invoke;
    v51 = &unk_24E26F1B8;
    v52 = v91;
    -[MKMapView _CPS_setCamera:animated:completionBlock:](v35, "_CPS_setCamera:animated:completionBlock:", v34, 1, &v47);

    objc_storeStrong((id *)&v52, 0);
    objc_storeStrong(&v68, 0);
    objc_storeStrong(&v71, 0);
  }
}

uint64_t __82__CPSPointsOfInterestMapViewController_updateMapViewEdgeInsetsFittingAnnotations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- ($C792053E57C9BD84572DC6E4DE3D885A)mapVisibleRegion
{
  double v3;
  double v4;
  double v5;
  double v6;
  $C792053E57C9BD84572DC6E4DE3D885A *result;
  MKMapView *v8;
  UILayoutGuide *v9;
  MKMapView *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v10 = -[CPSPointsOfInterestMapViewController mapView](self, "mapView");
  v9 = -[CPSPointsOfInterestMapViewController mapVisibleRegionGuide](self, "mapVisibleRegionGuide");
  -[UILayoutGuide layoutFrame](v9, "layoutFrame");
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v6;
  v8 = -[CPSPointsOfInterestMapViewController mapView](self, "mapView");
  -[MKMapView convertRect:toRegionFromView:](v10, "convertRect:toRegionFromView:", v11, v12, v13, v14);

  return result;
}

- (void)highlightModel:(id)a3
{
  id v3;
  MKMapView *v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  MKAnnotationView *v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  NSMutableDictionary *v14;
  id v15;
  id location[2];
  CPSPointsOfInterestMapViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v5 = -[CPSPointsOfInterestMapViewController clusterAnnotations](v17, "clusterAnnotations");
    v6 = (id)objc_msgSend(location[0], "identifier");
    v7 = (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:");
    v13 = 0;
    v11 = 0;
    v9 = 0;
    if (v7)
    {
      v3 = v7;
    }
    else
    {
      v14 = -[CPSPointsOfInterestMapViewController annotations](v17, "annotations");
      v13 = 1;
      v12 = (id)objc_msgSend(location[0], "identifier");
      v11 = 1;
      v10 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:");
      v9 = 1;
      v3 = v10;
    }
    v15 = v3;
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    v4 = -[CPSPointsOfInterestMapViewController mapView](v17, "mapView");
    v8 = -[MKMapView viewForAnnotation:](v4, "viewForAnnotation:", v15);

    -[MKAnnotationView setSelected:animated:](v8, "setSelected:animated:", 1, 1);
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)unhighlightModel:(id)a3
{
  id v3;
  MKMapView *v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  MKAnnotationView *v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  NSMutableDictionary *v14;
  id v15;
  id location[2];
  CPSPointsOfInterestMapViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v5 = -[CPSPointsOfInterestMapViewController clusterAnnotations](v17, "clusterAnnotations");
    v6 = (id)objc_msgSend(location[0], "identifier");
    v7 = (id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:");
    v13 = 0;
    v11 = 0;
    v9 = 0;
    if (v7)
    {
      v3 = v7;
    }
    else
    {
      v14 = -[CPSPointsOfInterestMapViewController annotations](v17, "annotations");
      v13 = 1;
      v12 = (id)objc_msgSend(location[0], "identifier");
      v11 = 1;
      v10 = (id)-[NSMutableDictionary objectForKey:](v14, "objectForKey:");
      v9 = 1;
      v3 = v10;
    }
    v15 = v3;
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    v4 = -[CPSPointsOfInterestMapViewController mapView](v17, "mapView");
    v8 = -[MKMapView viewForAnnotation:](v4, "viewForAnnotation:", v15);

    -[MKAnnotationView setSelected:animated:](v8, "setSelected:animated:", 0, 1);
    objc_storeStrong((id *)&v8, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)reloadAnnotations:(BOOL)a3
{
  id v3;
  NSMutableDictionary *v4;
  MKMapView *v5;
  MKMapView *v6;
  MKMapView *v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  NSMutableDictionary *v28;
  NSArray *v29;
  MKMapView *v30;
  id obj;
  uint64_t v32;
  _QWORD v33[8];
  id v34;
  id location;
  _QWORD v36[8];
  id v37;
  _QWORD __b[8];
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  SEL v45;
  CPSPointsOfInterestMapViewController *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  v45 = a2;
  v44 = a3;
  if ((-[CPSPointsOfInterestMapViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
  {
    v28 = -[CPSPointsOfInterestMapViewController annotations](v46, "annotations");
    v27 = (id)-[NSMutableDictionary allValues](v28, "allValues");
    v43 = (id)objc_msgSend(v27, "mutableCopy");

    v30 = -[CPSPointsOfInterestMapViewController mapView](v46, "mapView");
    v29 = -[MKMapView annotations](v30, "annotations");
    v42 = (id)-[NSArray mutableCopy](v29, "mutableCopy");

    v41 = (id)objc_msgSend(v43, "mutableCopy");
    v40 = (id)objc_opt_new();
    memset(__b, 0, sizeof(__b));
    obj = v43;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
    if (v32)
    {
      v24 = *(_QWORD *)__b[2];
      v25 = 0;
      v26 = v32;
      while (1)
      {
        v23 = v25;
        if (*(_QWORD *)__b[2] != v24)
          objc_enumerationMutation(obj);
        v39 = *(_QWORD *)(__b[1] + 8 * v25);
        if ((objc_msgSend(v42, "containsObject:", v39) & 1) != 0)
          objc_msgSend(v41, "removeObject:", v39);
        ++v25;
        if (v23 + 1 >= v26)
        {
          v25 = 0;
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
          if (!v26)
            break;
        }
      }
    }

    memset(v36, 0, sizeof(v36));
    v21 = v42;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v36, v48, 16);
    if (v22)
    {
      v18 = *(_QWORD *)v36[2];
      v19 = 0;
      v20 = v22;
      while (1)
      {
        v17 = v19;
        if (*(_QWORD *)v36[2] != v18)
          objc_enumerationMutation(v21);
        v37 = *(id *)(v36[1] + 8 * v19);
        if ((objc_msgSend(v43, "containsObject:", v37) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v40, "addObject:", v37);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              location = v37;
              memset(v33, 0, sizeof(v33));
              v15 = (id)objc_msgSend(location, "memberAnnotations");
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", v33, v47, 16);
              if (v16)
              {
                v12 = *(_QWORD *)v33[2];
                v13 = 0;
                v14 = v16;
                while (1)
                {
                  v11 = v13;
                  if (*(_QWORD *)v33[2] != v12)
                    objc_enumerationMutation(v15);
                  v34 = *(id *)(v33[1] + 8 * v13);
                  v10 = -[CPSPointsOfInterestMapViewController clusterAnnotations](v46, "clusterAnnotations");
                  v9 = (id)objc_msgSend(v34, "pointOfInterest");
                  v8 = (id)objc_msgSend(v9, "identifier");
                  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:");

                  ++v13;
                  if (v11 + 1 >= v14)
                  {
                    v13 = 0;
                    v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", v33, v47, 16);
                    if (!v14)
                      break;
                  }
                }
              }

              objc_storeStrong(&location, 0);
            }
          }
        }
        ++v19;
        if (v17 + 1 >= v20)
        {
          v19 = 0;
          v20 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", v36, v48, 16);
          if (!v20)
            break;
        }
      }
    }

    v6 = -[CPSPointsOfInterestMapViewController mapView](v46, "mapView");
    -[MKMapView removeAnnotations:](v6, "removeAnnotations:", v40);

    v7 = -[CPSPointsOfInterestMapViewController mapView](v46, "mapView");
    -[MKMapView addAnnotations:](v7, "addAnnotations:", v41);

    if (v44)
    {
      v5 = -[CPSPointsOfInterestMapViewController mapView](v46, "mapView");
      v4 = -[CPSPointsOfInterestMapViewController annotations](v46, "annotations");
      v3 = (id)-[NSMutableDictionary allValues](v4, "allValues");
      -[MKMapView showAnnotations:animated:](v5, "showAnnotations:animated:");

      -[CPSPointsOfInterestMapViewController updateMapViewEdgeInsetsFittingAnnotations:](v46, "updateMapViewEdgeInsetsFittingAnnotations:", 1);
      -[CPSPointsOfInterestMapViewController setHasPerformedInitialLayout:](v46, "setHasPerformedInitialLayout:", 1);
    }
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
  }
}

- (void)zoomToLocation:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  MKMapView *v6;
  id v7;
  id location[2];
  CPSPointsOfInterestMapViewController *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSPointsOfInterestMapViewController annotations](v9, "annotations");
  v3 = (id)objc_msgSend(location[0], "identifier");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:");

  v6 = -[CPSPointsOfInterestMapViewController mapView](v9, "mapView");
  v10[0] = v7;
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  -[MKMapView showAnnotations:animated:](v6, "showAnnotations:animated:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  objc_class *v4;
  CPSPointOfInterestAnnotationView *v5;
  objc_class *v6;
  double v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  CPSPointOfInterestClusterView *v11;
  objc_class *v12;
  id v14;
  id v15;
  CPSPointOfInterestClusterView *v16;
  id v17;
  NSString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  CPSPointOfInterestAnnotationView *v31;
  id v32;
  NSString *v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  BOOL v40;
  id v41;
  id v42;
  char v44;
  CPSPointOfInterestClusterView *v45;
  char v46;
  NSString *v47;
  CPSPointOfInterestClusterView *v48;
  char v49;
  id v50;
  char v51;
  NSString *v52;
  char v53;
  CPSPointOfInterestAnnotationView *v54;
  char v55;
  NSString *v56;
  CPSPointOfInterestAnnotationView *v57;
  id v58;
  BOOL v59;
  id v60;
  id v61;
  id v62;
  id location[2];
  CPSPointsOfInterestMapViewController *v64;

  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v62 = 0;
  objc_storeStrong(&v62, a4);
  v61 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = v62;
    v39 = -[CPSPointsOfInterestMapViewController template](v64, "template");
    v35 = objc_msgSend(v39, "selectedIndex");
    v38 = -[CPSPointsOfInterestMapViewController pointsOfInterest](v64, "pointsOfInterest");
    v37 = (id)objc_msgSend(v38, "pointsOfInterest");
    v36 = (id)objc_msgSend(v60, "pointOfInterest");
    v40 = v35 == objc_msgSend(v37, "indexOfObject:");

    v59 = v40;
    v42 = (id)objc_msgSend(v60, "pointOfInterest");
    v41 = (id)objc_msgSend(v42, "pinImageSet");
    v58 = (id)objc_msgSend(v41, "image");

    if (v58)
    {
      v32 = location[0];
      v4 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v4);
      v34 = (id)objc_msgSend(v32, "dequeueReusableAnnotationViewWithIdentifier:");
      v55 = 0;
      v53 = 0;
      if (v34)
      {
        v5 = (CPSPointOfInterestAnnotationView *)v34;
      }
      else
      {
        v31 = [CPSPointOfInterestAnnotationView alloc];
        v30 = v62;
        v6 = (objc_class *)objc_opt_class();
        v56 = NSStringFromClass(v6);
        v55 = 1;
        v54 = -[CPSPointOfInterestAnnotationView initWithAnnotation:reuseIdentifier:](v31, "initWithAnnotation:reuseIdentifier:", v30);
        v53 = 1;
        v5 = v54;
      }
      v57 = v5;
      if ((v53 & 1) != 0)

      if ((v55 & 1) != 0)
      v27 = (id)objc_msgSend(v60, "pointOfInterest");
      v26 = (id)objc_msgSend(v27, "pinImageSet");
      -[CPSPointOfInterestAnnotationView setImageSet:](v57, "setImageSet:");

      v29 = (id)objc_msgSend(v60, "pointOfInterest");
      v28 = (id)objc_msgSend(v29, "selectedPinImageSet");
      -[CPSPointOfInterestAnnotationView setSelectedImageSet:](v57, "setSelectedImageSet:");

      if (v59)
        v25 = 0;
      else
        v25 = kCPSPointsOfInterestClusteringIdentifier;
      -[MKAnnotationView setClusteringIdentifier:](v57, "setClusteringIdentifier:", v25);
      if (v59)
      {
        LODWORD(v7) = 1148846080;
        objc_msgSend(v61, "setDisplayPriority:", v7);
      }
      objc_storeStrong(&v61, v57);
      objc_storeStrong((id *)&v57, 0);
    }
    else
    {
      v22 = location[0];
      v8 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v8);
      v24 = (id)objc_msgSend(v22, "dequeueReusableAnnotationViewWithIdentifier:");
      v51 = 0;
      v49 = 0;
      if (v24)
      {
        objc_storeStrong(&v61, v24);
      }
      else
      {
        v21 = objc_alloc(MEMORY[0x24BDDB150]);
        v20 = v62;
        v9 = (objc_class *)objc_opt_class();
        v52 = NSStringFromClass(v9);
        v51 = 1;
        v50 = (id)objc_msgSend(v21, "initWithAnnotation:reuseIdentifier:", v20);
        v49 = 1;
        objc_storeStrong(&v61, v50);
      }
      if ((v49 & 1) != 0)

      if ((v51 & 1) != 0)
    }
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v60, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = location[0];
      v10 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v10);
      v19 = (id)objc_msgSend(v17, "dequeueReusableAnnotationViewWithIdentifier:");
      v46 = 0;
      v44 = 0;
      if (v19)
      {
        v11 = (CPSPointOfInterestClusterView *)v19;
      }
      else
      {
        v16 = [CPSPointOfInterestClusterView alloc];
        v15 = v62;
        v12 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v12);
        v46 = 1;
        v45 = -[CPSPointOfInterestClusterView initWithAnnotation:reuseIdentifier:](v16, "initWithAnnotation:reuseIdentifier:", v15);
        v44 = 1;
        v11 = v45;
      }
      v48 = v11;
      if ((v44 & 1) != 0)

      if ((v46 & 1) != 0)
      objc_storeStrong(&v61, v48);
      objc_storeStrong((id *)&v48, 0);
    }
  }
  v14 = v61;
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
  return v14;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v9;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  id v13;
  id location[3];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  memset(__b, 0, sizeof(__b));
  v9 = v13;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(v9);
      v12 = *(id *)(__b[1] + 8 * v6);
      objc_msgSend(v12, "setEnabled:", 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)mapView:(id)a3 clusterAnnotationForMemberAnnotations:(id)a4
{
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v16;
  uint64_t v17;
  _QWORD __b[8];
  id v19;
  id v20;
  id v21;
  id location[2];
  CPSPointsOfInterestMapViewController *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v4 = objc_alloc(MEMORY[0x24BDDB040]);
  v20 = (id)objc_msgSend(v4, "initWithMemberAnnotations:", v21);
  memset(__b, 0, sizeof(__b));
  v16 = v21;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v17)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v17;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(v16);
      v19 = *(id *)(__b[1] + 8 * v13);
      v10 = -[CPSPointsOfInterestMapViewController clusterAnnotations](v23, "clusterAnnotations");
      v7 = v20;
      v9 = (id)objc_msgSend(v19, "pointOfInterest");
      v8 = (id)objc_msgSend(v9, "identifier");
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v7);

      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v14)
          break;
      }
    }
  }

  v6 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v4;
  CPSPointsOfInterestPickerViewController *v5;
  id v7;
  char isKindOfClass;
  id v9;
  id v10;
  id location[2];
  CPSPointsOfInterestMapViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v7 = (id)objc_msgSend(v10, "annotation");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (id)objc_msgSend(v10, "annotation");
    v5 = -[CPSPointsOfInterestMapViewController pickerViewController](v12, "pickerViewController");
    v4 = (id)objc_msgSend(v9, "pointOfInterest");
    -[CPSPointsOfInterestPickerViewController setSelectedItem:](v5, "setSelectedItem:");

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id location[2];
  CPSPointsOfInterestMapViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isRegionChanging") & 1) != 0)
    -[CPSPointsOfInterestMapViewController _notifyRegionDidChange](v5, "_notifyRegionDidChange");
  objc_storeStrong(location, 0);
}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  id location[2];
  CPSPointsOfInterestMapViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[CPSPointsOfInterestMapViewController hasPerformedInitialLayout](v6, "hasPerformedInitialLayout")
    && a4
    && (objc_msgSend(location[0], "_isAnimating") & 1) == 0)
  {
    -[CPSPointsOfInterestMapViewController setHasPerformedInitialLayout:](v6, "setHasPerformedInitialLayout:", 1);
    -[CPSPointsOfInterestMapViewController _notifyRegionDidChange](v6, "_notifyRegionDidChange");
  }
  objc_storeStrong(location, 0);
}

- (void)_notifyRegionDidChange
{
  double v2;
  double v3;
  double v4;
  double v5;
  CPSEntityActionDelegate *v6;
  CPSEntityResourceProvider *v7;
  NSTimer *v8;
  BOOL v9;

  v8 = -[CPSPointsOfInterestMapViewController panTimer](self, "panTimer");
  v9 = 0;
  if (!v8)
    v9 = -[CPSPointsOfInterestMapViewController hasPerformedInitialLayout](self, "hasPerformedInitialLayout");

  if (v9)
  {
    v7 = -[CPSBaseEntityContentViewController resourceProvider](self, "resourceProvider");
    v6 = -[CPSEntityResourceProvider actionDelegate](v7, "actionDelegate");
    -[CPSPointsOfInterestMapViewController mapVisibleRegion](self, "mapVisibleRegion");
    -[CPSEntityActionDelegate entityContentViewController:regionDidChange:](v6, "entityContentViewController:regionDidChange:", self, v2, v3, v4, v5);

  }
}

- (void)zoomIn
{
  MKMapView *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[2];
  CPSPointsOfInterestMapViewController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[CPSPointsOfInterestMapViewController mapView](self, "mapView");
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __46__CPSPointsOfInterestMapViewController_zoomIn__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  -[MKMapView _zoomInWithCompletionHandler:](v2, "_zoomInWithCompletionHandler:");

  objc_storeStrong(v8, 0);
}

uint64_t __46__CPSPointsOfInterestMapViewController_zoomIn__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)zoomOut
{
  MKMapView *v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[2];
  CPSPointsOfInterestMapViewController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = -[CPSPointsOfInterestMapViewController mapView](self, "mapView");
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __47__CPSPointsOfInterestMapViewController_zoomOut__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = v9;
  -[MKMapView _zoomOutWithCompletionHandler:](v2, "_zoomOutWithCompletionHandler:");

  objc_storeStrong(v8, 0);
}

uint64_t __47__CPSPointsOfInterestMapViewController_zoomOut__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)beginPanningWithCompletion:(id)a3
{
  CPSPanViewController *v3;
  uint64_t v4;
  void *v5;
  id v6;
  CPSPointsOfInterestPickerViewController *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CPSPointsOfInterestMapViewController *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  CPSPointsOfInterestMapViewController *v20;
  id location[2];
  CPSPointsOfInterestMapViewController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[CPSPointsOfInterestMapViewController panViewController](v22, "panViewController");
  v8 = v3 != 0;

  if (!v8)
    -[CPSPointsOfInterestMapViewController setUpPanView](v22, "setUpPanView");
  -[CPSPointsOfInterestMapViewController setPanCompletionHandler:](v22, "setPanCompletionHandler:", location[0]);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v7 = -[CPSPointsOfInterestMapViewController pickerViewController](v22, "pickerViewController");
  v6 = (id)-[CPSPointsOfInterestPickerViewController view](v7, "view");
  v4 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke;
  v19 = &unk_24E26F1B8;
  v20 = v22;
  v9 = v4;
  v10 = -1073741824;
  v11 = 0;
  v12 = __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke_2;
  v13 = &unk_24E26F168;
  v14 = v22;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 0x10000, &v15, &v9, 0.25);

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

void __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "panViewController");
  v1 = (id)objc_msgSend(v2, "view");
  objc_msgSend(v1, "setAlpha:");

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerViewController");
  v3 = (id)objc_msgSend(v4, "view");
  objc_msgSend(v3, "setAlpha:", 0.0);

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "donePanningButton");
  objc_msgSend(v6, "setAlpha:", 1.0);

}

uint64_t __67__CPSPointsOfInterestMapViewController_beginPanningWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "panViewController");
  v2 = (id)objc_msgSend(v3, "view");
  objc_msgSend(v2, "setHidden:", 0);

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerViewController");
  v4 = (id)objc_msgSend(v5, "view");
  objc_msgSend(v4, "setHidden:", 1);

  v6 = (void *)MEMORY[0x24BDD1628];
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerModeConstraints");
  objc_msgSend(v6, "deactivateConstraints:");

  v8 = (void *)MEMORY[0x24BDD1628];
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "panModeConstraints");
  objc_msgSend(v8, "activateConstraints:");

  objc_msgSend(*(id *)(a1 + 32), "updateMapViewEdgeInsetsFittingAnnotations:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusedItem");
}

- (void)centerMap
{
  CLLocation *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  MKMapView *v6;
  CLLocation *v7;
  MKMapCamera *v8;
  MKMapView *v9;
  NSMutableDictionary *v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CPSPointsOfInterestMapViewController *v18;
  __int128 v19;
  __int128 v20;
  id v21;
  __int128 v22;
  SEL v23;
  CPSPointsOfInterestMapViewController *v24;

  v24 = self;
  v23 = a2;
  v2 = -[CPSPointsOfInterestMapViewController userLocation](self, "userLocation");
  v12 = v2 != 0;

  if (v12)
  {
    -[CPSPointsOfInterestMapViewController setCenterMapPending:](v24, "setCenterMapPending:", 0);
    v7 = -[CPSPointsOfInterestMapViewController userLocation](v24, "userLocation");
    -[CLLocation coordinate](v7, "coordinate");
    *(_QWORD *)&v22 = v3;
    *((_QWORD *)&v22 + 1) = v4;

    v9 = -[CPSPointsOfInterestMapViewController mapView](v24, "mapView");
    v8 = -[MKMapView camera](v9, "camera");
    v21 = (id)-[MKMapCamera copy](v8, "copy");

    v20 = v22;
    v19 = v22;
    objc_msgSend(v21, "setCenterCoordinate:", v22);
    v10 = -[CPSPointsOfInterestMapViewController annotations](v24, "annotations");
    v11 = -[NSMutableDictionary count](v10, "count") != 0;

    if (!v11)
      objc_msgSend(v21, "setCenterCoordinateDistance:", 12500.0);
    v6 = -[CPSPointsOfInterestMapViewController mapView](v24, "mapView");
    v5 = v21;
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __49__CPSPointsOfInterestMapViewController_centerMap__block_invoke;
    v17 = &unk_24E26F1B8;
    v18 = v24;
    -[MKMapView _CPS_setCamera:animated:completionBlock:](v6, "_CPS_setCamera:animated:completionBlock:", v5, 1, &v13);

    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v21, 0);
  }
  else
  {
    -[CPSPointsOfInterestMapViewController setCenterMapPending:](v24, "setCenterMapPending:", 1);
  }
}

uint64_t __49__CPSPointsOfInterestMapViewController_centerMap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSPointsOfInterestMapViewController *v11;
  id v12;
  id location[2];
  CPSPointsOfInterestMapViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __75__CPSPointsOfInterestMapViewController_locationManager_didUpdateLocations___block_invoke;
  v10 = &unk_24E26F1B8;
  v11 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSPointsOfInterestMapViewController_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  id v1;
  BOOL v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "centerMapPending") & 1) != 0)
  {
    v1 = (id)objc_msgSend(*(id *)(a1 + 32), "annotations");
    v2 = objc_msgSend(v1, "count") != 0;

    if (!v2)
      objc_msgSend(*(id *)(a1 + 32), "centerMap");
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSPointsOfInterestMapViewController *v11;
  id v12;
  id location[2];
  CPSPointsOfInterestMapViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (objc_msgSend(v12, "code") == 1)
  {
    queue = MEMORY[0x24BDAC9B8];
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __73__CPSPointsOfInterestMapViewController_locationManager_didFailWithError___block_invoke;
    v10 = &unk_24E26F1B8;
    v11 = v14;
    dispatch_async(queue, &v6);

    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __73__CPSPointsOfInterestMapViewController_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "locationManager");
  objc_msgSend(v1, "stopUpdatingLocation");

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSPointsOfInterestMapViewController *v9;
  id location[2];
  CPSPointsOfInterestMapViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __78__CPSPointsOfInterestMapViewController_locationManagerDidChangeAuthorization___block_invoke;
  v8 = &unk_24E26F1B8;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __78__CPSPointsOfInterestMapViewController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result;
  id v2;
  char v3;
  id v4;

  v3 = objc_msgSend(*(id *)(a1 + 32), "isLocationAuthorized");
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mapView");
  objc_msgSend(v4, "setShowsUserLocation:", v3 & 1);

  result = objc_msgSend(*(id *)(a1 + 32), "isLocationAuthorized");
  if ((result & 1) != 0)
  {
    v2 = (id)objc_msgSend(*(id *)(a1 + 32), "locationManager");
    objc_msgSend(v2, "startUpdatingLocation");

    return objc_msgSend(*(id *)(a1 + 32), "setCenterMapPending:", 1);
  }
  return result;
}

- (void)setUpLocationManager
{
  CLLocationManager *v2;
  CPSTemplateEnvironment *v3;
  CPSEntityResourceProvider *v4;
  id v5;
  CPSPointsOfInterestMapViewController *v6;
  id v7;
  id v8;
  id v9;
  CPSPointsOfInterestMapViewController *v10;
  CLLocationManager *v11;
  double v12;
  CLLocationManager *v13;
  double v14;
  CLLocationManager *v15;
  BOOL v16;
  id v17[2];
  CPSPointsOfInterestMapViewController *v18;

  v18 = self;
  v17[1] = (id)a2;
  v2 = -[CPSPointsOfInterestMapViewController locationManager](self, "locationManager");
  v16 = v2 != 0;

  if (!v16)
  {
    v4 = -[CPSBaseEntityContentViewController resourceProvider](v18, "resourceProvider");
    v3 = -[CPSEntityResourceProvider templateEnvironment](v4, "templateEnvironment");
    v17[0] = -[CPSTemplateEnvironment bundleIdentifier](v3, "bundleIdentifier");

    v7 = objc_alloc(MEMORY[0x24BDBFA88]);
    v5 = v17[0];
    v6 = v18;
    v9 = MEMORY[0x24BDAC9B8];
    v8 = (id)objc_msgSend(v7, "initWithEffectiveBundleIdentifier:delegate:onQueue:", v5, v6);
    -[CPSPointsOfInterestMapViewController setLocationManager:](v18, "setLocationManager:");

    v10 = v18;
    v11 = -[CPSPointsOfInterestMapViewController locationManager](v18, "locationManager");
    -[CLLocationManager setDelegate:](v11, "setDelegate:", v10);

    v12 = *MEMORY[0x24BDBFB08];
    v13 = -[CPSPointsOfInterestMapViewController locationManager](v18, "locationManager");
    -[CLLocationManager setDistanceFilter:](v13, "setDistanceFilter:", v12);

    v14 = *MEMORY[0x24BDBFB28];
    v15 = -[CPSPointsOfInterestMapViewController locationManager](v18, "locationManager");
    -[CLLocationManager setDesiredAccuracy:](v15, "setDesiredAccuracy:", v14);

    objc_storeStrong(v17, 0);
  }
}

- (BOOL)isLocationAuthorized
{
  BOOL v2;
  CLLocationManager *v4;
  CLAuthorizationStatus v5;

  v4 = -[CPSPointsOfInterestMapViewController locationManager](self, "locationManager");
  v5 = -[CLLocationManager authorizationStatus](v4, "authorizationStatus");

  v2 = v5 != kCLAuthorizationStatusAuthorizedWhenInUse && v5 != kCLAuthorizationStatusAuthorizedAlways;
  return !v2;
}

- (void)setUpPanView
{
  id *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSActionButton *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  CPSActionButton *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CPSActionButton *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CPSActionButton *v28;
  CPSPanViewController *v29;
  CPSTemplateEnvironment *v30;
  CPSEntityResourceProvider *v31;
  CPSPanViewController *v32;
  CPSPanViewController *v33;
  id v34;
  CPSPanViewController *v35;
  id v36;
  CPSPanViewController *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  CPSPanViewController *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  CPSPanViewController *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  CPSPanViewController *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  CPSPanViewController *v66;
  CPSActionButton *v67;
  CPSActionButton *v68;
  CPSActionButton *v69;
  CPSActionButton *v70;
  CPSActionButton *v71;
  id v72;
  CPSActionButton *v73;
  id v74;
  NSString *v75;
  CPSActionButton *v76;
  id v77;
  CPSActionButton *v78;
  id v79;
  CPSActionButton *v80;
  id v81;
  CPSActionButton *v82;
  id v83;
  CPSActionButton *v84;
  id v85;
  CPSActionButton *v86;
  CPSTemplateEnvironment *v87;
  CPSEntityResourceProvider *v88;
  BOOL v89;
  id location;
  id v91[2];
  CPSPointsOfInterestMapViewController *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  NSString *v95;
  _QWORD v96[5];

  v96[4] = *MEMORY[0x24BDAC8D0];
  v92 = self;
  v91[1] = (id)a2;
  v91[0] = (id)objc_opt_new();
  v29 = [CPSPanViewController alloc];
  v31 = -[CPSBaseEntityContentViewController resourceProvider](v92, "resourceProvider");
  v30 = -[CPSEntityResourceProvider templateEnvironment](v31, "templateEnvironment");
  location = -[CPSPanViewController initWithEnvironment:](v29, "initWithEnvironment:");

  objc_msgSend(location, "setPanDelegate:", v92);
  -[CPSPointsOfInterestMapViewController setPanViewController:](v92, "setPanViewController:", location);
  v32 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  -[CPSPanViewController willMoveToParentViewController:](v32, "willMoveToParentViewController:", v92);

  v33 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  -[CPSPointsOfInterestMapViewController addChildViewController:](v92, "addChildViewController:");

  v36 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v35 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  v34 = (id)-[CPSPanViewController view](v35, "view");
  objc_msgSend(v36, "addSubview:");

  v37 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  -[CPSPanViewController didMoveToParentViewController:](v37, "didMoveToParentViewController:", v92);

  v66 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  v65 = (id)-[CPSPanViewController view](v66, "view");
  v64 = (id)objc_msgSend(v65, "topAnchor");
  v63 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v62 = (id)objc_msgSend(v63, "safeAreaLayoutGuide");
  v61 = (id)objc_msgSend(v62, "topAnchor");
  v60 = (id)objc_msgSend(v64, "constraintEqualToAnchor:");
  v96[0] = v60;
  v59 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  v58 = (id)-[CPSPanViewController view](v59, "view");
  v57 = (id)objc_msgSend(v58, "bottomAnchor");
  v56 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v55 = (id)objc_msgSend(v56, "safeAreaLayoutGuide");
  v54 = (id)objc_msgSend(v55, "bottomAnchor");
  v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
  v96[1] = v53;
  v52 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  v51 = (id)-[CPSPanViewController view](v52, "view");
  v50 = (id)objc_msgSend(v51, "leftAnchor");
  v49 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v48 = (id)objc_msgSend(v49, "safeAreaLayoutGuide");
  v47 = (id)objc_msgSend(v48, "leftAnchor");
  v46 = (id)objc_msgSend(v50, "constraintEqualToAnchor:");
  v96[2] = v46;
  v45 = -[CPSPointsOfInterestMapViewController panViewController](v92, "panViewController");
  v44 = (id)-[CPSPanViewController view](v45, "view");
  v43 = (id)objc_msgSend(v44, "rightAnchor");
  v42 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v41 = (id)objc_msgSend(v42, "safeAreaLayoutGuide");
  v40 = (id)objc_msgSend(v41, "rightAnchor");
  v39 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
  v96[3] = v39;
  v38 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96);
  objc_msgSend(v91[0], "addObjectsFromArray:");

  v67 = objc_alloc_init(CPSActionButton);
  -[CPSPointsOfInterestMapViewController setDonePanningButton:](v92, "setDonePanningButton:");

  v68 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSButton setDelegate:](v68, "setDelegate:", v92);

  v69 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSActionButton setLayoutDelegate:](v69, "setLayoutDelegate:", v92);

  v70 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSActionButton setTranslatesAutoresizingMaskIntoConstraints:](v70, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v72 = CPSLocalizedStringForKey(CFSTR("DONE"));
  v71 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSActionButton setButtonText:](v71, "setButtonText:", v72);

  v76 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  v75 = -[CPSActionButton buttonText](v76, "buttonText");
  v95 = v75;
  v74 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
  v73 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSActionButton setAccessibilityUserInputLabels:](v73, "setAccessibilityUserInputLabels:", v74);

  v78 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  v77 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  -[CPSActionButton setTitleColor:forState:](v78, "setTitleColor:forState:");

  v80 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  v79 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
  -[CPSActionButton setTitleColor:forState:](v80, "setTitleColor:forState:");

  v83 = +[CPSEntityStyles mapButtonDropShadow](CPSEntityStyles, "mapButtonDropShadow");
  v82 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  v81 = (id)-[CPSActionButton layer](v82, "layer");
  objc_msgSend(v83, "applyShadowToLayer:");

  v85 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
  v84 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  objc_msgSend(v85, "addSubview:");

  v86 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
  -[CPSActionButton setNeedsLayout](v86, "setNeedsLayout");

  v88 = -[CPSBaseEntityContentViewController resourceProvider](v92, "resourceProvider");
  v87 = -[CPSEntityResourceProvider templateEnvironment](v88, "templateEnvironment");
  v89 = -[CPSTemplateEnvironment rightHandDrive](v87, "rightHandDrive");

  if (v89)
  {
    v15 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
    v14 = (id)-[CPSActionButton trailingAnchor](v15, "trailingAnchor");
    v13 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
    v12 = (id)objc_msgSend(v13, "safeAreaLayoutGuide");
    v11 = (id)objc_msgSend(v12, "trailingAnchor");
    v10 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:", -8.0);
    v93[0] = v10;
    v9 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
    v8 = (id)-[CPSActionButton topAnchor](v9, "topAnchor");
    v7 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
    v6 = (id)objc_msgSend(v7, "safeAreaLayoutGuide");
    v5 = (id)objc_msgSend(v6, "topAnchor");
    v4 = (id)objc_msgSend(v8, "constraintEqualToAnchor:constant:", 8.0);
    v93[1] = v4;
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
    objc_msgSend(v91[0], "addObjectsFromArray:");

  }
  else
  {
    v28 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
    v27 = (id)-[CPSActionButton leadingAnchor](v28, "leadingAnchor");
    v26 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
    v25 = (id)objc_msgSend(v26, "safeAreaLayoutGuide");
    v24 = (id)objc_msgSend(v25, "leadingAnchor");
    v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:");
    v94[0] = v23;
    v22 = -[CPSPointsOfInterestMapViewController donePanningButton](v92, "donePanningButton");
    v21 = (id)-[CPSActionButton topAnchor](v22, "topAnchor");
    v20 = (id)-[CPSPointsOfInterestMapViewController view](v92, "view");
    v19 = (id)objc_msgSend(v20, "safeAreaLayoutGuide");
    v18 = (id)objc_msgSend(v19, "topAnchor");
    v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", 8.0);
    v94[1] = v17;
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 2);
    objc_msgSend(v91[0], "addObjectsFromArray:");

  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v91[0], v91);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v2, 0);
}

- (void)didSelectButton:(id)a3
{
  CPSActionButton *v3;
  CPSActionButton *v4;
  BOOL v5;
  id location[2];
  CPSPointsOfInterestMapViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (CPSActionButton *)location[0];
  v3 = -[CPSPointsOfInterestMapViewController donePanningButton](v7, "donePanningButton");
  v5 = v4 != v3;

  if (!v5)
    -[CPSPointsOfInterestMapViewController dismissPanView:](v7, "dismissPanView:", location[0]);
  objc_storeStrong(location, 0);
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_5();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)font
{
  return +[CPSEntityStyles mapButtonFont](CPSEntityStyles, "mapButtonFont", a2, self);
}

- (id)buttonBackgroundColor
{
  id v2;
  CPSActionButton *v4;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v9;

  v4 = -[CPSPointsOfInterestMapViewController donePanningButton](self, "donePanningButton");
  v7 = 0;
  v5 = 0;
  if ((-[CPSActionButton isFocused](v4, "isFocused") & 1) != 0)
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v7 = 1;
    v2 = v8;
  }
  else
  {
    v6 = +[CPSEntityStyles mapButtonBackgroundColor](CPSEntityStyles, "mapButtonBackgroundColor");
    v5 = 1;
    v2 = v6;
  }
  v9 = v2;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  return v9;
}

- (double)buttonRadius
{
  return 14.0;
}

- (void)panBeganWithDirection:(int64_t)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10[2];
  void *v11;
  SEL v12;
  CPSPointsOfInterestMapViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = (void *)a3;
  v3 = (void *)MEMORY[0x24BDBCF40];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __62__CPSPointsOfInterestMapViewController_panBeganWithDirection___block_invoke;
  v9 = &unk_24E2701A0;
  v10[0] = self;
  v10[1] = v11;
  v4 = (id)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, 0.016);
  -[CPSPointsOfInterestMapViewController setPanTimer:](v13, "setPanTimer:");

  objc_storeStrong(v10, 0);
}

void __62__CPSPointsOfInterestMapViewController_panBeganWithDirection___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  id v4;
  id v5;
  id v6;
  unint64_t v8;
  double v9;
  double v10;
  id v11[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = (id)a1;
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "mapView");
  v5 = (id)objc_msgSend(v6, "camera");
  v11[0] = (id)objc_msgSend(v5, "copy");

  objc_msgSend(v11[0], "centerCoordinate");
  v9 = v2;
  v10 = v3;
  objc_msgSend(v11[0], "altitude");
  v8 = *(_QWORD *)(a1 + 40) - 1;
  if (v8 <= 7)
    __asm { BR              X8 }
  objc_msgSend(v11[0], "setCenterCoordinate:", v9, v10);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mapView");
  objc_msgSend(v4, "setCamera:animated:", v11[0], 0);

  objc_storeStrong(v11, 0);
  objc_storeStrong(location, 0);
}

- (void)panEndedWithDirection:(int64_t)a3
{
  NSTimer *v3;

  v3 = -[CPSPointsOfInterestMapViewController panTimer](self, "panTimer");
  -[NSTimer invalidate](v3, "invalidate");

  -[CPSPointsOfInterestMapViewController setPanTimer:](self, "setPanTimer:", 0);
  -[CPSPointsOfInterestMapViewController _notifyRegionDidChange](self, "_notifyRegionDidChange");
}

- (void)panWithDirection:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  id v6;
  MKMapView *v7;
  MKMapCamera *v8;
  MKMapView *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CPSPointsOfInterestMapViewController *v15;
  __int128 v16;
  __int128 v17;
  double v18;
  __int128 v19;
  id v20;
  int64_t v21;
  SEL v22;
  CPSPointsOfInterestMapViewController *v23;

  v23 = self;
  v22 = a2;
  v21 = a3;
  v9 = -[CPSPointsOfInterestMapViewController mapView](self, "mapView");
  v8 = -[MKMapView camera](v9, "camera");
  v20 = (id)-[MKMapCamera copy](v8, "copy");

  objc_msgSend(v20, "centerCoordinate");
  *(_QWORD *)&v19 = v3;
  *((_QWORD *)&v19 + 1) = v4;
  objc_msgSend(v20, "altitude");
  v18 = 0.003 * (v5 / 1000.0);
  if ((unint64_t)(v21 - 1) <= 7)
    __asm { BR              X8 }
  v17 = v19;
  v16 = v19;
  objc_msgSend(v20, "setCenterCoordinate:", v19);
  v7 = -[CPSPointsOfInterestMapViewController mapView](v23, "mapView");
  v6 = v20;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __57__CPSPointsOfInterestMapViewController_panWithDirection___block_invoke;
  v14 = &unk_24E26F1B8;
  v15 = v23;
  -[MKMapView _CPS_setCamera:animated:completionBlock:](v7, "_CPS_setCamera:animated:completionBlock:", v6, 1, &v10);

  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
}

uint64_t __57__CPSPointsOfInterestMapViewController_panWithDirection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyRegionDidChange", a1, a1);
}

- (void)dismissPanView:(id)a3
{
  void (**v3)(void);
  uint64_t v4;
  void *v5;
  id v6;
  CPSPointsOfInterestPickerViewController *v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CPSPointsOfInterestMapViewController *v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  CPSPointsOfInterestMapViewController *v20;
  id location[2];
  CPSPointsOfInterestMapViewController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (void *)MEMORY[0x24BDF6F90];
  v7 = -[CPSPointsOfInterestMapViewController pickerViewController](v22, "pickerViewController");
  v6 = (id)-[CPSPointsOfInterestPickerViewController view](v7, "view");
  v4 = MEMORY[0x24BDAC760];
  v15 = MEMORY[0x24BDAC760];
  v16 = -1073741824;
  v17 = 0;
  v18 = __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke;
  v19 = &unk_24E26F1B8;
  v20 = v22;
  v9 = v4;
  v10 = -1073741824;
  v11 = 0;
  v12 = __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke_2;
  v13 = &unk_24E26F168;
  v14 = v22;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 0x10000, &v15, &v9, 0.25);

  v8 = -[CPSPointsOfInterestMapViewController panCompletionHandler](v22, "panCompletionHandler");
  if (v8)
  {
    v3 = (void (**)(void))-[CPSPointsOfInterestMapViewController panCompletionHandler](v22, "panCompletionHandler");
    v3[2]();

    -[CPSPointsOfInterestMapViewController setPanCompletionHandler:](v22, "setPanCompletionHandler:", 0);
  }
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

void __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "panViewController");
  v1 = (id)objc_msgSend(v2, "view");
  objc_msgSend(v1, "setAlpha:");

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerViewController");
  v3 = (id)objc_msgSend(v4, "view");
  objc_msgSend(v3, "setAlpha:", 1.0);

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "donePanningButton");
  objc_msgSend(v6, "setAlpha:", 0.0);

}

uint64_t __55__CPSPointsOfInterestMapViewController_dismissPanView___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "panViewController");
  v2 = (id)objc_msgSend(v3, "view");
  objc_msgSend(v2, "setHidden:", 1);

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerViewController");
  v4 = (id)objc_msgSend(v5, "view");
  objc_msgSend(v4, "setHidden:", 0);

  v6 = (void *)MEMORY[0x24BDD1628];
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "panModeConstraints");
  objc_msgSend(v6, "deactivateConstraints:");

  v8 = (void *)MEMORY[0x24BDD1628];
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "pickerModeConstraints");
  objc_msgSend(v8, "activateConstraints:");

  objc_msgSend(*(id *)(a1 + 32), "updateMapViewEdgeInsetsFittingAnnotations:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateFocusedItem");
}

- (void)picker:(id)a3 didSelectModel:(id)a4
{
  CPSPointsOfInterestMapViewController *v5;
  id v6;
  CPSEntityActionDelegate *v7;
  CPSEntityResourceProvider *v8;
  id v9;
  id location[2];
  CPSPointsOfInterestMapViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  -[CPSPointsOfInterestMapViewController highlightModel:](v11, "highlightModel:", v9);
  v8 = -[CPSBaseEntityContentViewController resourceProvider](v11, "resourceProvider");
  v7 = -[CPSEntityResourceProvider actionDelegate](v8, "actionDelegate");
  v5 = v11;
  v6 = (id)objc_msgSend(v9, "identifier");
  -[CPSEntityActionDelegate entityContentViewController:didSelectPointOfInterestWithIdentifier:](v7, "entityContentViewController:didSelectPointOfInterestWithIdentifier:", v5);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didDeselectModel:(id)a4
{
  id v5;
  id location[2];
  CPSPointsOfInterestMapViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSPointsOfInterestMapViewController unhighlightModel:](v7, "unhighlightModel:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didHighlightModel:(id)a4
{
  id v5;
  id location[2];
  CPSPointsOfInterestMapViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSPointsOfInterestMapViewController highlightModel:](v7, "highlightModel:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)picker:(id)a3 didUnhighlightModel:(id)a4
{
  id v5;
  id location[2];
  CPSPointsOfInterestMapViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSPointsOfInterestMapViewController unhighlightModel:](v7, "unhighlightModel:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)_linearFocusMovementSequences
{
  id v3;
  id v4;
  id v5;
  id v6[2];
  CPSPointsOfInterestMapViewController *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = self;
  v6[1] = (id)a2;
  v3 = objc_alloc(MEMORY[0x24BDF70C0]);
  v4 = -[CPSPointsOfInterestMapViewController _linearFocusItems](v7, "_linearFocusItems");
  v6[0] = (id)objc_msgSend(v3, "initWithItems:loops:restrictEnteringSequence:");

  v8[0] = v6[0];
  v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)_linearFocusItems
{
  double v2;
  double v3;
  id v5;
  CPSEntityMapButton *v6;
  CPSPointsOfInterestMapControlsViewController *v7;
  CPSPointsOfInterestPickerViewController *v8;
  CPSPointsOfInterestMapControlsViewController *v9;
  CPSPointsOfInterestMapControlsViewController *v10;
  CPSEntityMapButton *v11;
  CPSActionButton *v12;
  CPSActionButton *v13;
  BOOL v14;
  id v15;
  id v16;
  CPSEntityMapButton *v17;
  CPSPointsOfInterestMapControlsViewController *v18;
  CPSPointsOfInterestMapControlsViewController *v19;
  CPSEntityMapButton *v20;
  id v21;
  id v22;
  CPSEntityMapButton *v23;
  CPSPointsOfInterestMapControlsViewController *v24;
  CPSPointsOfInterestMapControlsViewController *v25;
  CPSEntityMapButton *v26;
  CPSEntityMapButton *v27;
  CPSPointsOfInterestMapControlsViewController *v28;
  CPSPointsOfInterestMapControlsViewController *v29;
  CPSEntityMapButton *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  CPSActionButton *v37;
  CPSActionButton *v38;
  BOOL v39;
  id v40;
  id v41;
  id v42;
  id v43;
  CPSEntityMapButton *v44;
  CPSPointsOfInterestMapControlsViewController *v45;
  CPSPointsOfInterestMapControlsViewController *v46;
  CPSEntityMapButton *v47;
  CPSEntityMapButton *v48;
  CPSPointsOfInterestMapControlsViewController *v49;
  CPSPointsOfInterestMapControlsViewController *v50;
  CPSEntityMapButton *v51;
  id v52;
  id v53;
  CPSEntityMapButton *v54;
  CPSPointsOfInterestMapControlsViewController *v55;
  CPSPointsOfInterestMapControlsViewController *v56;
  CPSEntityMapButton *v57;
  CPSPanViewController *v58;
  CPSTemplateEnvironment *v59;
  CPSEntityResourceProvider *v60;
  BOOL v61;
  CPSPanViewController *v62;
  id v63;
  BOOL v64;
  id v65;
  id v66;
  BOOL v67;
  id location;
  char v69;
  id v70;
  char v71;
  CPSPanViewController *v72;
  BOOL v73;
  id v74[2];
  CPSPointsOfInterestMapViewController *v75;

  v75 = self;
  v74[1] = (id)a2;
  v74[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v73 = 0;
  v62 = -[CPSPointsOfInterestMapViewController panViewController](v75, "panViewController");
  v63 = (id)-[CPSPanViewController view](v62, "view");
  v71 = 0;
  v69 = 0;
  v64 = 0;
  if (v63)
  {
    v72 = -[CPSPointsOfInterestMapViewController panViewController](v75, "panViewController");
    v71 = 1;
    v70 = (id)-[CPSPanViewController view](v72, "view");
    v69 = 1;
    v64 = (objc_msgSend(v70, "isHidden") & 1) == 0;
  }
  if ((v69 & 1) != 0)

  if ((v71 & 1) != 0)
  v73 = v64;
  if (v64)
  {
    v58 = -[CPSPointsOfInterestMapViewController panViewController](v75, "panViewController");
    location = -[CPSPanViewController panView](v58, "panView");

    v60 = -[CPSBaseEntityContentViewController resourceProvider](v75, "resourceProvider");
    v59 = -[CPSEntityResourceProvider templateEnvironment](v60, "templateEnvironment");
    v61 = -[CPSTemplateEnvironment rightHandDrive](v59, "rightHandDrive");

    v67 = v61;
    if (v61)
    {
      v34 = (id)objc_msgSend(location, "panRightButton");

      if (v34)
      {
        v33 = (id)objc_msgSend(location, "panRightButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v32 = (id)objc_msgSend(location, "panDownButton");

      if (v32)
      {
        v31 = (id)objc_msgSend(location, "panDownButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v29 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v30 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v29, "zoomOutButton");

      if (v30)
      {
        v28 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v27 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v28, "zoomOutButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v25 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v26 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v25, "zoomInButton");

      if (v26)
      {
        v24 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v23 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v24, "zoomInButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v22 = (id)objc_msgSend(location, "panLeftButton");

      if (v22)
      {
        v21 = (id)objc_msgSend(location, "panLeftButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v19 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v20 = -[CPSPointsOfInterestMapControlsViewController centerButton](v19, "centerButton");

      if (v20)
      {
        v18 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v17 = -[CPSPointsOfInterestMapControlsViewController centerButton](v18, "centerButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v16 = (id)objc_msgSend(location, "panUpButton");

      if (v16)
      {
        v15 = (id)objc_msgSend(location, "panUpButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v13 = -[CPSPointsOfInterestMapViewController donePanningButton](v75, "donePanningButton");
      -[CPSActionButton alpha](v13, "alpha");
      v14 = v3 != 1.0;

      if (!v14)
      {
        v12 = -[CPSPointsOfInterestMapViewController donePanningButton](v75, "donePanningButton");
        objc_msgSend(v74[0], "addObject:");

      }
    }
    else
    {
      v56 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v57 = -[CPSPointsOfInterestMapControlsViewController centerButton](v56, "centerButton");

      if (v57)
      {
        v55 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v54 = -[CPSPointsOfInterestMapControlsViewController centerButton](v55, "centerButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v53 = (id)objc_msgSend(location, "panRightButton");

      if (v53)
      {
        v52 = (id)objc_msgSend(location, "panRightButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v50 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v51 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v50, "zoomInButton");

      if (v51)
      {
        v49 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v48 = -[CPSPointsOfInterestMapControlsViewController zoomInButton](v49, "zoomInButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v46 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v47 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v46, "zoomOutButton");

      if (v47)
      {
        v45 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
        v44 = -[CPSPointsOfInterestMapControlsViewController zoomOutButton](v45, "zoomOutButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v43 = (id)objc_msgSend(location, "panDownButton");

      if (v43)
      {
        v42 = (id)objc_msgSend(location, "panDownButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v41 = (id)objc_msgSend(location, "panLeftButton");

      if (v41)
      {
        v40 = (id)objc_msgSend(location, "panLeftButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v38 = -[CPSPointsOfInterestMapViewController donePanningButton](v75, "donePanningButton");
      -[CPSActionButton alpha](v38, "alpha");
      v39 = v2 != 1.0;

      if (!v39)
      {
        v37 = -[CPSPointsOfInterestMapViewController donePanningButton](v75, "donePanningButton");
        objc_msgSend(v74[0], "addObject:");

      }
      v36 = (id)objc_msgSend(location, "panUpButton");

      if (v36)
      {
        v35 = (id)objc_msgSend(location, "panUpButton");
        objc_msgSend(v74[0], "addObject:");

      }
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    v8 = -[CPSPointsOfInterestMapViewController pickerViewController](v75, "pickerViewController");
    v66 = -[CPSPointsOfInterestPickerViewController _linearFocusItems](v8, "_linearFocusItems");

    v9 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
    v65 = -[CPSPointsOfInterestMapControlsViewController _linearFocusItems](v9, "_linearFocusItems");

    v10 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
    v11 = -[CPSPointsOfInterestMapControlsViewController centerButton](v10, "centerButton");

    if (v11)
    {
      v7 = -[CPSPointsOfInterestMapViewController mapControlsViewController](v75, "mapControlsViewController");
      v6 = -[CPSPointsOfInterestMapControlsViewController centerButton](v7, "centerButton");
      objc_msgSend(v74[0], "addObject:");

    }
    if (v66)
      objc_msgSend(v74[0], "addObjectsFromArray:", v66);
    if (v65)
      objc_msgSend(v74[0], "addObjectsFromArray:", v65);
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, 0);
  }
  v5 = v74[0];
  objc_storeStrong(v74, 0);
  return v5;
}

- (BOOL)useRightHandDriveFocusGuide
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  id v3;
  CPSPointsOfInterestPickerViewController *v4;
  CPSPanViewController *v5;
  CPSPanButton *v6;
  CPSPanViewController *v7;
  id v8;
  BOOL v9;
  int v10;
  id v11;
  CPSPanView *v12;
  char v13;
  id v14;
  char v15;
  CPSPanViewController *v16;
  BOOL v17;
  SEL v18;
  CPSPointsOfInterestMapViewController *v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v19 = self;
  v18 = a2;
  v17 = 0;
  v7 = -[CPSPointsOfInterestMapViewController panViewController](self, "panViewController");
  v8 = (id)-[CPSPanViewController view](v7, "view");
  v15 = 0;
  v13 = 0;
  v9 = 0;
  if (v8)
  {
    v16 = -[CPSPointsOfInterestMapViewController panViewController](v19, "panViewController");
    v15 = 1;
    v14 = (id)-[CPSPanViewController view](v16, "view");
    v13 = 1;
    v9 = (objc_msgSend(v14, "isHidden") & 1) == 0;
  }
  if ((v13 & 1) != 0)

  if ((v15 & 1) != 0)
  v17 = v9;
  if (v9)
  {
    v5 = -[CPSPointsOfInterestMapViewController panViewController](v19, "panViewController");
    v12 = -[CPSPanViewController panView](v5, "panView");

    v6 = -[CPSPanView panUpButton](v12, "panUpButton");
    v22[0] = v6;
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);

    objc_storeStrong((id *)&v12, 0);
  }
  else
  {
    v4 = -[CPSPointsOfInterestMapViewController pickerViewController](v19, "pickerViewController");
    v11 = -[CPSPointsOfInterestPickerViewController _linearFocusItems](v4, "_linearFocusItems");

    if (objc_msgSend(v11, "count"))
    {
      v3 = (id)objc_msgSend(v11, "firstObject");
      v21 = v3;
      v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);

      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (!v10)
      v20 = MEMORY[0x24BDBD1A8];
  }
  return v20;
}

- (void)_updateFocusedItem
{
  id v2;
  id v3[2];
  CPSPointsOfInterestMapViewController *v4;

  v4 = self;
  v3[1] = (id)a2;
  v3[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF70D0]), "initWithEnvironment:", self);
  objc_msgSend(v3[0], "setAllowsDeferral:", 0);
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v4);
  objc_msgSend(v2, "_requestFocusUpdate:", v3[0]);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (CPSPointsOfInterestPickerViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerViewController, a3);
}

- (CPSPointsOfInterestMapControlsViewController)mapControlsViewController
{
  return self->_mapControlsViewController;
}

- (void)setMapControlsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mapControlsViewController, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (UILayoutGuide)mapVisibleRegionGuide
{
  return self->_mapVisibleRegionGuide;
}

- (void)setMapVisibleRegionGuide:(id)a3
{
  objc_storeStrong((id *)&self->_mapVisibleRegionGuide, a3);
}

- (BOOL)centerMapPending
{
  return self->_centerMapPending;
}

- (void)setCenterMapPending:(BOOL)a3
{
  self->_centerMapPending = a3;
}

- (NSArray)pickerModeConstraints
{
  return self->_pickerModeConstraints;
}

- (void)setPickerModeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_pickerModeConstraints, a3);
}

- (NSArray)panModeConstraints
{
  return self->_panModeConstraints;
}

- (void)setPanModeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_panModeConstraints, a3);
}

- (NSMutableDictionary)annotations
{
  return self->_annotations;
}

- (NSMutableDictionary)clusterAnnotations
{
  return self->_clusterAnnotations;
}

- (void)setClusterAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_clusterAnnotations, a3);
}

- (CPSPanViewController)panViewController
{
  return self->_panViewController;
}

- (void)setPanViewController:(id)a3
{
  objc_storeStrong((id *)&self->_panViewController, a3);
}

- (id)panCompletionHandler
{
  return self->_panCompletionHandler;
}

- (void)setPanCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (CPSActionButton)donePanningButton
{
  return self->_donePanningButton;
}

- (void)setDonePanningButton:(id)a3
{
  objc_storeStrong((id *)&self->_donePanningButton, a3);
}

- (NSTimer)panTimer
{
  return self->_panTimer;
}

- (void)setPanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_panTimer, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_panTimer, 0);
  objc_storeStrong((id *)&self->_donePanningButton, 0);
  objc_storeStrong(&self->_panCompletionHandler, 0);
  objc_storeStrong((id *)&self->_panViewController, 0);
  objc_storeStrong((id *)&self->_clusterAnnotations, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_panModeConstraints, 0);
  objc_storeStrong((id *)&self->_pickerModeConstraints, 0);
  objc_storeStrong((id *)&self->_mapVisibleRegionGuide, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_mapControlsViewController, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end
