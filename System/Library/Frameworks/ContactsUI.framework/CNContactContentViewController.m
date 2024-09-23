@implementation CNContactContentViewController

- (BOOL)isSiri
{
  return self->_isSiri;
}

- (NSAttributedString)verifiedInfoMessage
{
  return self->_verifiedInfoMessage;
}

- (BOOL)alwaysEditing
{
  return self->_alwaysEditing;
}

- (void)setWarningMessage:(id)a3
{
  objc_storeStrong((id *)&self->_warningMessage, a3);
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (NSString)primaryProperty
{
  return self->_primaryProperty;
}

- (BOOL)shouldShowLinkedContacts
{
  return self->_shouldShowLinkedContacts;
}

- (CNContactContentViewController)init
{
  void *v3;
  CNContactContentViewController *v4;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNContactContentViewController initWithEnvironment:](self, "initWithEnvironment:", v3);

  return v4;
}

- (CNContactContentViewController)initWithEnvironment:(id)a3
{
  id v4;
  CNContactContentViewController *v5;
  CNContactContentViewController *v6;
  objc_super v8;

  v4 = a3;
  if ((-[CNContactContentViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || -[CNContactContentViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (CNContactContentViewController *)objc_msgSend(objc_alloc(+[CNContactContentViewController classForContentViewControllerImpl](CNContactContentViewController, "classForContentViewControllerImpl")), "initWithEnvironment:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactContentViewController;
    v5 = -[CNContactContentViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  }
  v6 = v5;

  return v6;
}

- (void)setShouldShowLinkedContacts:(BOOL)a3
{
  self->_shouldShowLinkedContacts = a3;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  self->_editingProposedInformation = a3;
}

- (void)setAlwaysEditing:(BOOL)a3
{
  self->_alwaysEditing = a3;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setParentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_parentContainer, a3);
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "classForContentViewControllerImpl"), "descriptorForRequiredKeys");
}

+ (Class)classForContentViewControllerImpl
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isFeatureEnabled:", 4);

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_cardActions, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_destroyWeak((id *)&self->_personHeaderViewDelegate);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_primaryProperty, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (CNContactContentViewController)initWithContact:(id)a3
{
  id v4;
  void *v5;
  CNContactContentViewController *v6;

  v4 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  if (v6)
    -[CNContactContentViewController setContact:](v6, "setContact:", v4);

  return v6;
}

- (CNContactContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNContactContentViewController *v6;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNContactContentViewController initWithEnvironment:](self, "initWithEnvironment:", v5);

  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  objc_storeStrong((id *)&self->_parentGroup, a3);
}

- (CNContactView)contactView
{
  return self->_contactView;
}

- (CNContactHeaderView)contactHeaderView
{
  return self->_contactHeaderView;
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)a3
{
  self->_allowsActions = a3;
}

- (BOOL)allowsPropertyActions
{
  return self->_allowsPropertyActions;
}

- (void)setAllowsPropertyActions:(BOOL)a3
{
  self->_allowsPropertyActions = a3;
}

- (BOOL)allowsCardActions
{
  return self->_allowsCardActions;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  self->_allowsCardActions = a3;
}

- (BOOL)allowsConferencing
{
  return self->_allowsConferencing;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  self->_allowsConferencing = a3;
}

- (BOOL)allowsSharing
{
  return self->_allowsSharing;
}

- (void)setAllowsSharing:(BOOL)a3
{
  self->_allowsSharing = a3;
}

- (BOOL)allowsAddToFavorites
{
  return self->_allowsAddToFavorites;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  self->_allowsAddToFavorites = a3;
}

- (BOOL)allowsSendMessage
{
  return self->_allowsSendMessage;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  self->_allowsSendMessage = a3;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  self->_allowsAddingToAddressBook = a3;
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  return self->_allowsSettingLinkedContactsAsPreferred;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  self->_allowsSettingLinkedContactsAsPreferred = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  self->_showsInlineActions = a3;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (BOOL)showsGroupMembership
{
  return self->_showsGroupMembership;
}

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (BOOL)allowsActionsModel
{
  return self->_allowsActionsModel;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  self->_allowsActionsModel = a3;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  self->_allowsEditPhoto = a3;
}

- (BOOL)editingProposedInformation
{
  return self->_editingProposedInformation;
}

- (BOOL)hideCardActions
{
  return self->_hideCardActions;
}

- (void)setHideCardActions:(BOOL)a3
{
  self->_hideCardActions = a3;
}

- (BOOL)isMailVIP
{
  return self->_isMailVIP;
}

- (void)setIsMailVIP:(BOOL)a3
{
  self->_isMailVIP = a3;
}

- (BOOL)showContactBlockingFirst
{
  return self->_showContactBlockingFirst;
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  self->_showContactBlockingFirst = a3;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)warningMessage
{
  return self->_warningMessage;
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (void)setImportantMessage:(id)a3
{
  objc_storeStrong((id *)&self->_importantMessage, a3);
}

- (void)setVerifiedInfoMessage:(id)a3
{
  objc_storeStrong((id *)&self->_verifiedInfoMessage, a3);
}

- (void)setPrimaryProperty:(id)a3
{
  objc_storeStrong((id *)&self->_primaryProperty, a3);
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (void)setPersonHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderView, a3);
}

- (UIViewController)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (void)setPersonHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_personHeaderViewController, a3);
}

- (CNContactViewControllerCustomHeaderViewDelegate)personHeaderViewDelegate
{
  return (CNContactViewControllerCustomHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_personHeaderViewDelegate);
}

- (void)setPersonHeaderViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_personHeaderViewDelegate, a3);
}

- (CNCardGroup)cardTopGroup
{
  return self->_cardTopGroup;
}

- (CNCardGroup)cardBottomGroup
{
  return self->_cardBottomGroup;
}

- (CNCardGroup)cardFooterGroup
{
  return self->_cardFooterGroup;
}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  return (CNContactContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactDelegate, a3);
}

- (CNPresenterDelegate)presentingDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setContactViewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewConfiguration, a3);
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSArray)cardActions
{
  return self->_cardActions;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (NSArray)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setMissingRequiredKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingRequiredKeys, a3);
}

- (NSArray)originalContacts
{
  return self->_originalContacts;
}

- (void)setOriginalContacts:(id)a3
{
  objc_storeStrong((id *)&self->_originalContacts, a3);
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setInitialPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_initialPrompt, a3);
}

- (CNUIContactSaveExecutor)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveContactExecutor, a3);
}

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, a3);
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setRecentsData:(id)a3
{
  objc_storeStrong((id *)&self->_recentsData, a3);
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (CNCardFaceTimeGroup)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (void)setCardFaceTimeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, a3);
}

- (NSMutableArray)displayGroups
{
  return self->_displayGroups;
}

- (void)setDisplayGroups:(id)a3
{
  objc_storeStrong((id *)&self->_displayGroups, a3);
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "classForContentViewControllerImpl"), "descriptorForRequiredKeysWithDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setTableView:(id)a3
{
  NSLog(CFSTR("We can't do this, if you see this, file a radar to PEP Contacts."), a2, a3);
}

- (UITableView)tableView
{
  return 0;
}

- (int64_t)indexOfGroup:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end
